import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

import '../databases/isar_service.dart';
import '../models/models.dart';
import 'create_line_screen.dart';
import 'line_details_screen.dart';

class LineListScreen extends StatelessWidget {
  const LineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isar = IsarService.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои линии'),
      ),
      body: StreamBuilder<List<Line>>(
        // Реактивный поток: эмитит новый список при любом изменении Line.
        stream: isar.lines
            .where()
            .sortByStartDateDesc()
            .watch(fireImmediately: true),
        builder: (context, snapshot) {
          // Первая загрузка
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Ошибка
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Не удалось загрузить линии.\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final lines = snapshot.data ?? const <Line>[];

          // Пустое состояние
          if (lines.isEmpty) {
            return const _EmptyState();
          }

          // Список линий
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
            itemCount: lines.length,
            itemBuilder: (context, index) {
              final line = lines[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LineDetailsScreen(lineId: line.id),
                      ),
                    );
                  },
                  child: _LineCard(line: line),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateLineScreen()),
          );
        },
        tooltip: 'Новая линия',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Пустой экран.
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.biotech_outlined,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Нет активных экспериментов.\n'
              'Нажмите +, чтобы начать лотерею генов!',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Карточка одной линии.
class _LineCard extends StatelessWidget {
  final Line line;

  const _LineCard({required this.line});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Название + плашка статуса
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    line.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(isCompleted: line.isCompleted),
              ],
            ),
            const SizedBox(height: 8),

            // Целевой признак
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.flag_outlined,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    line.targetTrait.isEmpty
                        ? 'Признак не задан'
                        : line.targetTrait,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Дата старта
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  'Старт: ${_formatDate(line.startDate)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d.$m.${date.year}';
  }
}

/// Плашка статуса.
class _StatusBadge extends StatelessWidget {
  final bool isCompleted;

  const _StatusBadge({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final bg = isCompleted
        ? scheme.secondaryContainer
        : scheme.primaryContainer;
    final fg = isCompleted
        ? scheme.onSecondaryContainer
        : scheme.onPrimaryContainer;
    final label = isCompleted ? 'Завершён' : 'В процессе';
    final icon = isCompleted ? Icons.check_circle_outline : Icons.autorenew;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fg),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}