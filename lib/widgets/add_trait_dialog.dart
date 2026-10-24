import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

import '../databases/isar_service.dart';
import '../models/models.dart';

/// Вызывает диалог добавления тега. 
/// Возвращает созданный тег или null, если пользователь отменил ввод.
Future<Trait?> showAddTraitDialog(BuildContext context) async {
  return showDialog<Trait>(
    context: context,
    builder: (context) => const AddTraitDialog(),
  );
}

class AddTraitDialog extends StatefulWidget {
  const AddTraitDialog({super.key});

  @override
  State<AddTraitDialog> createState() => _AddTraitDialogState();
}

class _AddTraitDialogState extends State<AddTraitDialog> {
  // Контроллер теперь живет внутри State
  final _controller = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _controller.dispose(); // Уничтожается строго при закрытии диалога
    super.dispose();
  }

  Future<void> _save() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    setState(() => _saving = true);

    try {
      final isar = IsarService.instance;

      // Проверка на дубликат
      final existing = await isar.traits.filter().nameEqualTo(name).findFirst();
      if (existing != null) {
        if (mounted) Navigator.pop(context, existing);
        return;
      }

      // Вычисление порядка
      final maxOrder = await isar.traits.where().sortBySortOrderDesc().findFirst();

      final trait = Trait()
        ..name = name
        ..isBuiltIn = false
        ..sortOrder = (maxOrder?.sortOrder ?? 0) + 1;

      // Сохранение в БД
      await isar.writeTxn(() async {
        await isar.traits.put(trait);
      });

      if (mounted) Navigator.pop(context, trait);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: $e')),
      );
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Новый тег внешности'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          labelText: 'Название',
          hintText: 'Например, «Панда»',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => _save(),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: _saving ? null : _save,
          child: _saving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Добавить'),
        ),
      ],
    );
  }
}