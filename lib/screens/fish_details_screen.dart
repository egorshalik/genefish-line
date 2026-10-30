import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

import '../models/models.dart';
import '../databases/isar_service.dart';

class FishDetailsScreen extends StatelessWidget {
  final int fishId;

  const FishDetailsScreen({super.key, required this.fishId});

  @override
  Widget build(BuildContext context) {
    final isar = IsarService.instance; 
    return StreamBuilder<Fish?>(
      stream: isar.fishs.watchObject(fishId, fireImmediately: true),
      builder: (context, snapshot) {
        final fish = snapshot.data;
        
        if (fish == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final theme = Theme.of(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(fish.customId),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Удалить рыбу?'),
                      content: const Text('Это действие нельзя отменить.'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Отмена')),
                        FilledButton(
                          style: FilledButton.styleFrom(backgroundColor: theme.colorScheme.error),
                          onPressed: () => Navigator.pop(context, true), 
                          child: const Text('Удалить')
                        ),
                      ],
                    ),
                  );
                  
                  if (confirm == true) {
                    await isar.writeTxn(() async {
                      await isar.fishs.delete(fish.id);
                    });
                    if (context.mounted) Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 1. ФОТО
              _buildPhoto(fish, theme),
              const SizedBox(height: 16),

              // 2. ОСНОВНАЯ ИНФОРМАЦИЯ
              _buildMainInfo(fish, theme),
              const SizedBox(height: 16),

              // 3. ТЕГИ
              Text('Теги внешности', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              if (fish.traits.isEmpty)
                Text('Теги не указаны', style: TextStyle(color: theme.colorScheme.onSurfaceVariant))
              else
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: fish.traits.map((t) => Chip(label: Text(t))).toList(),
                ),
              const SizedBox(height: 24),

              // 4. ГЕНЕАЛОГИЯ (РОДИТЕЛИ)
              Text('Происхождение', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              FutureBuilder(
                future: Future.wait([
                  _loadParent(fish.father),
                  _loadParent(fish.mother),
                ]),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const LinearProgressIndicator();
                  
                  final father = snapshot.data![0];
                  final mother = snapshot.data![1];

                  return Column(
                    children: [
                      _buildParentTile(context, 'Отец', father, Icons.male, Colors.blue),
                      const SizedBox(height: 8),
                      _buildParentTile(context, 'Мать', mother, Icons.female, Colors.pink),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Fish?> _loadParent(IsarLink<Fish> link) async {
    // Сначала загружаем данные из БД
    await link.load();
    // Затем возвращаем значение
    return link.value;
  }

  Widget _buildPhoto(Fish fish, ThemeData theme) {
    if (fish.photoPath != null && File(fish.photoPath!).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          File(fish.photoPath!),
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(Icons.photo_camera_outlined, size: 64, color: theme.colorScheme.onSurfaceVariant),
      ),
    );
  }

  Widget _buildMainInfo(Fish fish, ThemeData theme) {
    return Card(
      elevation: 0,
      color: fish.hasTargetTrait 
          ? theme.colorScheme.primaryContainer 
          : theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Поколение: ${fish.generation}', style: theme.textTheme.titleLarge),
                Chip(
                  label: Text(fish.gender == Gender.male ? 'Самец' : (fish.gender == Gender.female ? 'Самка' : 'Неизвестно')),
                  avatar: Icon(
                    fish.gender == Gender.male ? Icons.male : Icons.female,
                    color: fish.gender == Gender.male ? Colors.blue : Colors.pink,
                    size: 18,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Icon(
                  Icons.bolt, 
                  color: fish.hasTargetTrait ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant
                ),
                const SizedBox(width: 8),
                Text(
                  fish.hasTargetTrait ? 'Обладает целевым признаком' : 'Без целевого признака',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: fish.hasTargetTrait ? theme.colorScheme.primary : null,
                    fontWeight: fish.hasTargetTrait ? FontWeight.bold : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Универсальный виджет для карточки родителя
  Widget _buildParentTile(BuildContext context, String label, Fish? parent, IconData icon, Color color) {
    final theme = Theme.of(context);
    
    if (parent == null) {
      return ListTile(
        shape: RoundedRectangleBorder(side: BorderSide(color: theme.dividerColor), borderRadius: BorderRadius.circular(12)),
        leading: CircleAvatar(backgroundColor: theme.colorScheme.surfaceContainerHighest, child: Icon(icon, color: color)),
        title: Text('$label не указан', style: TextStyle(color: theme.colorScheme.onSurfaceVariant)),
      );
    }

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: () {
          // Переходим на карточку родителя
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FishDetailsScreen(fishId: parent.id)),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(icon, color: color),
        ),
        title: Text('$label: ${parent.customId}'),
        subtitle: Text('Поколение ${parent.generation}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}