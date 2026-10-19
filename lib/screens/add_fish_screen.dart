import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';
import '../main.dart';
import '../utils/generation_utils.dart';
import '../utils/trait_label.dart';
import '../widgets/add_trait_dialog.dart';

class AddFishScreen extends StatefulWidget {
  final int lineId;

  const AddFishScreen({super.key, required this.lineId});

  @override
  State<AddFishScreen> createState() => _AddFishScreenState();
}

class _AddFishScreenState extends State<AddFishScreen> {
  final _formKey = GlobalKey<FormState>();
  final _customIdController = TextEditingController();
  final _picker = ImagePicker();

  String? _selectedImagePath;
  Gender? _gender;

  late Future<List<String>> _generationsFuture;
  late Future<List<Trait>> _traitsFuture;

  String? _generation;
  final Set<String> _selectedTraits = {};

  bool _hasTargetTrait = false;

  Line? _line;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadLine();
    _generationsFuture = GenerationUtils.listForLine(widget.lineId)
        .then((list) {
      if (mounted && _generation == null) {
        setState(() => _generation = list.length > 1 ? list[1] : list.first);
      }
      return list;
    });
    _traitsFuture = isar.traits.where().sortBySortOrder().findAll();
  }

  @override
  void dispose() {
    _customIdController.dispose();
    super.dispose();
  }

  Future<void> _loadLine() async {
    final line = await isar.lines.get(widget.lineId);
    if (mounted) setState(() => _line = line);
  }

  // ===== Фото ===== (без изменений — см. предыдущий файл) =====
Future<void> _showPhotoSourceSheet() async {
  final source = await showModalBottomSheet<ImageSource>(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Сделать снимок (Камера)'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Выбрать из галереи'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );

  if (source == null) return;
  await _pickImage(source);
}

Future<void> _pickImage(ImageSource source) async {
  try {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1600,
    );
    if (picked == null) return;
    if (!mounted) return;
    setState(() => _selectedImagePath = picked.path);
  } catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Не удалось получить фото: $e'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

  // ===== Теги =====

  Future<void> _addTrait() async {
    final created = await showAddTraitDialog(context);
    if (created == null || !mounted) return;
    // Обновляем список и сразу выбираем новый тег.
    setState(() {
      _traitsFuture = isar.traits.where().sortBySortOrder().findAll();
      _selectedTraits.add(created.name);
    });
  }

  // ===== Сохранение =====

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_gender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Выберите пол рыбы'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (_generation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Выберите поколение'),
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

      final fish = Fish()
        ..customId = _customIdController.text.trim()
        ..generation = _generation!
        ..gender = _gender!
        ..photoPath = _selectedImagePath
        ..traits = _selectedTraits.toList()
        ..hasTargetTrait = _hasTargetTrait
        ..line.value = line;

      await isar.writeTxn(() async {
        await isar.fishs.put(fish);
        await fish.line.save();
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

  // ===== UI =====

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = traitLabel(_line);
    final hasTraitConfigured =
        (_line?.targetTrait.trim().isNotEmpty) ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация особи')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            children: [
              // Фото
              _PhotoBlock(
                imagePath: _selectedImagePath,
                onTap: _showPhotoSourceSheet,
              ),
              if (_selectedImagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () =>
                          setState(() => _selectedImagePath = null),
                      icon: const Icon(Icons.delete_outline, size: 18),
                      label: const Text('Удалить фото'),
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // Код рыбы
              TextFormField(
                controller: _customIdController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Код рыбы',
                  hintText: 'F1-M-1',
                  prefixIcon: Icon(Icons.qr_code_2),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Введите код рыбы' : null,
              ),
              const SizedBox(height: 16),

              // Пол
              Text('Пол', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              SegmentedButton<Gender>(
                segments: const [
                  ButtonSegment<Gender>(
                    value: Gender.male,
                    icon: Icon(Icons.male),
                    label: Text('Самец'),
                  ),
                  ButtonSegment<Gender>(
                    value: Gender.female,
                    icon: Icon(Icons.female),
                    label: Text('Самка'),
                  ),
                ],
                selected: _gender == null ? const {} : {_gender!},
                emptySelectionAllowed: true,
                onSelectionChanged: (s) => setState(
                  () => _gender = s.isEmpty ? null : s.first,
                ),
              ),
              const SizedBox(height: 16),

              // Поколение — динамическое
              Text('Поколение', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              FutureBuilder<List<String>>(
                future: _generationsFuture,
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const LinearProgressIndicator();
                  }
                  final list = snap.data!;
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final g in list)
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

              // Целевой признак
              Card(
                elevation: 0,
                color: _hasTargetTrait
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surfaceContainerHigh,
                child: SwitchListTile(
                  title: Text('Обладает признаком «$label»'),
                  subtitle: Text(
                    hasTraitConfigured
                        ? 'Целевой признак линии'
                        : 'Признак линии не задан',
                  ),
                  secondary: Icon(
                    Icons.bolt,
                    color: _hasTargetTrait
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  value: _hasTargetTrait,
                  onChanged: (v) => setState(() => _hasTargetTrait = v),
                ),
              ),
              const SizedBox(height: 16),

              // Теги — динамические
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Теги внешности',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _addTrait,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Добавить тег'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              FutureBuilder<List<Trait>>(
                future: _traitsFuture,
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const LinearProgressIndicator();
                  }
                  final traits = snap.data!;
                  if (traits.isEmpty) {
                    return Text(
                      'Пока нет тегов. Нажмите «Добавить тег».',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    );
                  }
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final t in traits)
                        FilterChip(
                          label: Text(t.name),
                          selected: _selectedTraits.contains(t.name),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedTraits.add(t.name);
                              } else {
                                _selectedTraits.remove(t.name);
                              }
                            });
                          },
                        ),
                    ],
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
            label: Text(_saving ? 'Сохранение…' : 'Сохранить рыбу'),
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
// Блок фото
// ============================================================================

class _PhotoBlock extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onTap;

  const _PhotoBlock({required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          child: imagePath == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 48,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Сделать фото рыбы',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Material(
                        color: theme.colorScheme.surface,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: onTap,
                          tooltip: 'Заменить фото',
                          icon: const Icon(Icons.edit_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}