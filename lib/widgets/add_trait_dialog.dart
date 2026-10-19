import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/models.dart';

/// Показывает диалог, возвращает созданный Trait или null.
Future<Trait?> showAddTraitDialog(BuildContext context) async {
  final controller = TextEditingController();

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Новый тег внешности'),
      content: TextField(
        controller: controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: 'Название',
          hintText: 'Например, «Панда»',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => Navigator.pop(context, true),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Добавить'),
        ),
      ],
    ),
  );

  final name = controller.text.trim();
  controller.dispose();

  if (confirmed != true || name.isEmpty) return null;

  final existing = await isar.traits.filter().nameEqualTo(name).findFirst();
  if (existing != null) return existing;

  final maxOrder =
      await isar.traits.where().sortBySortOrderDesc().findFirst();

  final trait = Trait()
    ..name = name
    ..isBuiltIn = false
    ..sortOrder = (maxOrder?.sortOrder ?? 0) + 1;

  await isar.writeTxn(() async {
    await isar.traits.put(trait);
  });
  return trait;
}