import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';

import '../databases/isar_service.dart';
import '../models/models.dart';
import '../utils/trait_label.dart';
import '../utils/generation_utils.dart';

class AddLitterScreen extends StatefulWidget {
  final int lineId;

  const AddLitterScreen({super.key, required this.lineId});

  @override
  State<AddLitterScreen> createState() => _AddLitterScreenState();
}

class _AddLitterScreenState extends State<AddLitterScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime _birthDate = DateTime.now();
  String _generation = 'F1';
  int _totalCount = 0;
  int _targetCount = 0;

  Fish? _selectedFather;
  Fish? _selectedMother;
  Line? _line;

  late Future<List<Fish>> _malesFuture;
  late Future<List<Fish>> _femalesFuture;
  late Future<List<String>> _generationsFuture;
  final isar = IsarService.instance; 
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _malesFuture = _loadFish(Gender.male);
    _femalesFuture = _loadFish(Gender.female);
    _loadLine();
    _generationsFuture = GenerationUtils.listForLine(widget.lineId);
  }

  Future<void> _loadLine() async {
    final line = await isar.lines.get(widget.lineId);
    if (mounted) setState(() => _line = line);
  }

  Future<List<Fish>> _loadFish(Gender gender) {
    return isar.fishs
        .filter()
        .line((q) => q.idEqualTo(widget.lineId))
        .genderEqualTo(gender)
        .sortByCustomId()
        .findAll();
  }

  // ==========================================================================
  // Действия
  // ==========================================================================

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      helpText: 'Дата нереста',
    );
    if (picked != null && mounted) {
      setState(() => _birthDate = picked);
    }
  }

  void _incTotal() => setState(() => _totalCount++);

  void _decTotal() => setState(() {
        if (_totalCount > 0) _totalCount--;
        if (_targetCount > _totalCount) _targetCount = _totalCount;
      });

  void _incTarget() => setState(() {
        if (_targetCount < _totalCount) _targetCount++;
      });

  void _decTarget() => setState(() {
        if (_targetCount > 0) _targetCount--;
      });

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    if (_totalCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Укажите количество выживших мальков'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _saving = true);

    try {
      final line = await isar.lines.get(widget.lineId);
      if (line == null) {
        throw StateError('Линия #${widget.lineId} не найдена');
      }

      final litter = Litter()
        ..birthDate = _birthDate
        ..generation = _generation
        ..totalCount = _totalCount
        ..targetCount = _targetCount
        ..line.value = line;

      if (_selectedFather != null) {
        litter.father.value = _selectedFather!;
      }
      if (_selectedMother != null) {
        litter.mother.value = _selectedMother!;
      }

      await isar.writeTxn(() async {
        await isar.litters.put(litter);
        await litter.line.save();
        await litter.father.save();
        await litter.mother.save();
      });

      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка сохранения: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      setState(() => _saving = false);
    }
  }

  // ==========================================================================
  // UI
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = _birthDate.day.toString().padLeft(2, '0');
    final m = _birthDate.month.toString().padLeft(2, '0');
    final y = _birthDate.year;
    final percent = _totalCount > 0
        ? (_targetCount / _totalCount * 100).toStringAsFixed(1)
        : '0.0';
    final trait = traitLabel(_line);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новый помет мальков'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            children: [
              // --- Дата нереста -----------------------------------------------
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHigh,
                child: ListTile(
                  leading: const Icon(Icons.calendar_today_outlined),
                  title: const Text('Дата нереста'),
                  subtitle: Text('$d.$m.$y'),
                  trailing: TextButton(
                    onPressed: _pickDate,
                    child: const Text('Изменить дату'),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- Поколение --------------------------------------------------
              Text('Поколение', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              FutureBuilder<List<String>>(
                future: _generationsFuture,
                builder: (context, snap) {
                  if (!snap.hasData) return const LinearProgressIndicator();
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final g in snap.data!)
                        ChoiceChip(
                          label: Text(g),
                          selected: _generation == g,
                          onSelected: (_) =>
                              setState(() => _generation = g),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),

              // --- Счётчики ---------------------------------------------------
              _CounterField(
                label: 'Выжило всего мальков (к 1.5–2 мес.)',
                value: _totalCount,
                onIncrement: _incTotal,
                onDecrement: _decTotal,
                allowManualInput: true,
                onManualChanged: (v) {
                  setState(() {
                    _totalCount = v;
                    if (_targetCount > _totalCount) {
                      _targetCount = _totalCount;
                    }
                  });
                },
              ),
              const SizedBox(height: 12),
              _CounterField(
                label: 'Количество рыб с признаком «$trait»',
                value: _targetCount,
                onIncrement: _targetCount < _totalCount ? _incTarget : null,
                onDecrement: _targetCount > 0 ? _decTarget : null,
                allowManualInput: true,
                onManualChanged: (v) {
                  setState(() {
                    _targetCount = v.clamp(0, _totalCount);
                  });
                },
                helper: 'Не больше общего количества ($_totalCount)',
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Проявление «$trait»: $percent %',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- Родители ---------------------------------------------------
              Text('Родители (необязательно)',
                  style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              FutureBuilder<List<Fish>>(
                future: _malesFuture,
                builder: (context, snap) {
                  return _ParentDropdown(
                    label: 'Отец (самец)',
                    icon: Icons.male,
                    fishes: snap.data ?? const [],
                    value: _selectedFather,
                    loading:
                        snap.connectionState == ConnectionState.waiting,
                    onChanged: (f) => setState(() => _selectedFather = f),
                  );
                },
              ),
              const SizedBox(height: 12),
              FutureBuilder<List<Fish>>(
                future: _femalesFuture,
                builder: (context, snap) {
                  return _ParentDropdown(
                    label: 'Мать (самка)',
                    icon: Icons.female,
                    fishes: snap.data ?? const [],
                    value: _selectedMother,
                    loading:
                        snap.connectionState == ConnectionState.waiting,
                    onChanged: (f) => setState(() => _selectedMother = f),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_outlined),
            label: Text(_saving ? 'Сохранение…' : 'Сохранить помет'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Счётчик [- N +]
// ============================================================================

class _CounterField extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool allowManualInput;
  final ValueChanged<int>? onManualChanged;
  final String? helper;

  const _CounterField({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.allowManualInput = false,
    this.onManualChanged,
    this.helper,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton.filledTonal(
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove),
                  tooltip: 'Уменьшить',
                ),
                Expanded(
                  child: allowManualInput
                      ? TextFormField(
                          key: ValueKey(value),
                          initialValue: '$value',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                          ),
                          onChanged: (raw) {
                            final parsed = int.tryParse(raw) ?? 0;
                            onManualChanged?.call(parsed);
                          },
                          validator: (raw) {
                            final parsed = int.tryParse(raw ?? '');
                            if (parsed == null) return 'Введите число';
                            if (parsed < 0) return 'Не может быть < 0';
                            return null;
                          },
                        )
                      : Text(
                          '$value',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
                IconButton.filledTonal(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add),
                  tooltip: 'Увеличить',
                ),
              ],
            ),
            if (helper != null)
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 4),
                child: Text(
                  helper!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Выпадающий список родителей
// ============================================================================

class _ParentDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Fish> fishes;
  final Fish? value;
  final bool loading;
  final ValueChanged<Fish?> onChanged;

  const _ParentDropdown({
    required this.label,
    required this.icon,
    required this.fishes,
    required this.value,
    required this.loading,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = <DropdownMenuItem<Fish>>[
      const DropdownMenuItem<Fish>(
        value: null,
        child: Text('— не выбран —'),
      ),
      ...fishes.map(
        (f) => DropdownMenuItem<Fish>(
          value: f,
          child: Text('${f.customId} · ${f.generation}'),
        ),
      ),
    ];
    final safeValue =
        fishes.any((f) => f.id == value?.id) ? value : null;

    return DropdownButtonFormField<Fish>(
      initialValue: safeValue,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        helperText: loading
            ? 'Загрузка…'
            : (fishes.isEmpty ? 'Нет доступных рыб этого пола' : null),
      ),
      items: items,
      onChanged: loading ? null : onChanged,
    );
  }
}