import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

import '../databases/isar_service.dart';
import '../models/models.dart';
import 'add_litter_screen.dart';
import 'add_animal_screen.dart';
import 'animal_details_screen.dart';
import '../utils/trait_label.dart';

class LineDetailsScreen extends StatefulWidget {
  final int lineId;

  const LineDetailsScreen({super.key, required this.lineId});

  @override
  State<LineDetailsScreen> createState() => _LineDetailsScreenState();
}

class _LineDetailsScreenState extends State<LineDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final isar = IsarService.instance; 
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Реактивно следим за самой линией — чтобы AppBar обновлялся,
    // если, например, пользователь переименует её позже.
    return StreamBuilder<Line?>(
      stream: isar.lines.watchObject(widget.lineId, fireImmediately: true),
      builder: (context, snapshot) {
        final line = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: Text(line?.name ?? 'Линия'),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Журнал', icon: Icon(Icons.timeline)),
                Tab(text: 'Рыбы', icon: Icon(Icons.set_meal_outlined)),
                Tab(text: 'Статистика', icon: Icon(Icons.insights_outlined)),
              ],
            ),
          ),
          body: line == null
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _JournalTab(line: line),
                    _AnimalTab(line: line),
                    _StatsTab(line: line),
                  ],
                ),
        );
      },
    );
  }
}

// ============================================================================
// ВКЛАДКА 1 — ЖУРНАЛ (ПОМЕТЫ)
// ============================================================================

class _JournalTab extends StatelessWidget {
  final Line line;
  
  const _JournalTab({required this.line});

  @override
  Widget build(BuildContext context) {
    // Лениво подтягиваем все помёты этой линии, отсортированные по дате.

    final isar = IsarService.instance; 
    final label = traitLabel(line);
    return StreamBuilder<List<Litter>>(
      stream: isar.litters
          .filter()
          .line((q) => q.idEqualTo(line.id))
          .sortByBirthDateDesc()
          .watch(fireImmediately: true),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final litters = snapshot.data!;

        return Column(
          children: [
            Expanded(
              child: litters.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Журнал пуст.\nДобавьте первый нерест!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: litters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _LitterCard(litter: litters[index], traitLabel: label),
                        );
                      },
                    ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: FilledButton.icon(
                  onPressed: () async {
                    await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddLitterScreen(lineId: line.id),
                      ),
                    );
                    // StreamBuilder перестроится сам — watch() уже слушает коллекцию.
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить помёт'),
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LitterCard extends StatelessWidget {
  final Litter litter;
  final String traitLabel;

  const _LitterCard({required this.litter, required this.traitLabel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = litter.birthDate.day.toString().padLeft(2, '0');
    final m = litter.birthDate.month.toString().padLeft(2, '0');
    final y = litter.birthDate.year;
    final percent = litter.targetPercentage.toStringAsFixed(1);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Поколение ${litter.generation}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '$d.$m.$y',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Всего: ${litter.totalCount} · '
              '$traitLabel: ${litter.targetCount} ($percent%)',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// ВКЛАДКА 2 — РЫБЫ
// ============================================================================

class _AnimalTab extends StatelessWidget {
  final Line line;

  const _AnimalTab({required this.line});

  @override
  Widget build(BuildContext context) {
    final isar = IsarService.instance;
    return StreamBuilder<List<Animal>>(
      stream: isar.animals
          .filter()
          .line((q) => q.idEqualTo(line.id))
          .watch(fireImmediately: true),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final animals = snapshot.data!;
        final males = animals.where((f) => f.gender == Gender.male).toList();
        final females = animals.where((f) => f.gender == Gender.female).toList();
        final others = animals
            .where((f) => f.gender != Gender.male && f.gender != Gender.female)
            .toList();

        return Column(
          children: [
            Expanded(
              child: animals.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'В линии ещё нет рыб.\nДобавьте первого производителя!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _AnimalSection(
                          title: 'Самцы',
                          icon: Icons.male,
                          animals: males,
                          emptyText: 'Пока нет самцов',
                        ),
                        const SizedBox(height: 16),
                        _AnimalSection(
                          title: 'Самки',
                          icon: Icons.female,
                          animals: females,
                          emptyText: 'Пока нет самок',
                        ),
                        if (others.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          _AnimalSection(
                            title: 'Без пола / мальки',
                            icon: Icons.help_outline,
                            animals: others,
                            emptyText: '—',
                          ),
                        ],
                      ],
                    ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: FilledButton.icon(
                  onPressed: () async {
                    await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddAnimalScreen(lineId: line.id),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить рыбу'),
                  style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AnimalSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Animal> animals;
  final String emptyText;

  const _AnimalSection({
    required this.title,
    required this.icon,
    required this.animals,
    required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(width: 6),
            Text(
              '$title (${animals.length})',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (animals.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Text(
              emptyText,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ...animals.map(
            (f) => Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerHigh,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AnimalDetailsScreen(animalId: f.id),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: f.hasTargetTrait
                      ? theme.colorScheme.primaryContainer
                      : theme.colorScheme.surfaceContainerHighest,
                  child: Icon(
                    f.hasTargetTrait ? Icons.bolt : Icons.circle_outlined,
                    color: f.hasTargetTrait
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                title: Text(f.customId),
                subtitle: Text(
                  'Поколение ${f.generation}'
                  '${f.traits.isEmpty ? '' : ' · ${f.traits.join(', ')}'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ============================================================================
// ВКЛАДКА 3 — СТАТИСТИКА
// ============================================================================

class _StatsTab extends StatelessWidget {
  final Line line;

  const _StatsTab({required this.line});

  @override
  Widget build(BuildContext context) {
    final isar = IsarService.instance;
    
    return StreamBuilder<List<Litter>>(
      stream: isar.litters
          .filter()
          .line((q) => q.idEqualTo(line.id))
          .watch(fireImmediately: true),
      builder: (context, litterSnap) {
        return StreamBuilder<List<Animal>>(
          stream: isar.animals
              .filter()
              .line((q) => q.idEqualTo(line.id))
              .watch(fireImmediately: true),
          builder: (context, animalSnap) {
            if (!litterSnap.hasData || !animalSnap.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final litters = litterSnap.data!;
            final animals = animalSnap.data!;

            // Средний процент по всем помётам (взвешенный по totalCount).
            final totalAnimal = litters.fold<int>(
              0,
              (sum, l) => sum + l.totalCount,
            );
            final totalTarget = litters.fold<int>(
              0,
              (sum, l) => sum + l.targetCount,
            );
            final avgPercent =
                totalAnimal > 0 ? (totalTarget / totalAnimal) * 100 : 0.0;

            final theme = Theme.of(context);

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  elevation: 0,
                  color: theme.colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.bolt,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Целевой признак',
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          line.targetTrait.isEmpty
                              ? 'Не задан'
                              : line.targetTrait,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _StatTile(
                  icon: Icons.set_meal_outlined,
                  label: 'Рыб в линии',
                  value: '${animals.length}',
                  caption: '${animals.where((f) => f.hasTargetTrait).length} '
                   '${traitWithGenitive(line)}',
                ),
                const SizedBox(height: 12),
                _StatTile(
                  icon: Icons.percent,
                  label: 'Средний процент проявления',
                  value: '${avgPercent.toStringAsFixed(1)} %',
                  caption: totalAnimal > 0
                      ? 'По $totalAnimal малькам из ${litters.length} помётов'
                      : 'Пока нет данных о помётах',
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String caption;

  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.secondaryContainer,
          child: Icon(icon, color: theme.colorScheme.onSecondaryContainer),
        ),
        title: Text(label, style: theme.textTheme.bodyMedium),
        subtitle: Text(
          caption,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}