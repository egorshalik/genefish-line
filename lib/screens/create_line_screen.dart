import 'package:flutter/material.dart';
import '../databases/isar_service.dart';
import '../models/models.dart';

class CreateLineScreen extends StatefulWidget {
  const CreateLineScreen({super.key});

  @override
  State<CreateLineScreen> createState() => _CreateLineScreenState();
}

class _CreateLineScreenState extends State<CreateLineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _targetTraitController = TextEditingController();
  final isar = IsarService.instance; 
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _targetTraitController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    try {
      final line = Line()
        ..name = _nameController.text.trim()
        ..targetTrait = _targetTraitController.text.trim()
        ..startDate = DateTime.now()
        ..isCompleted = false;

      final isar = IsarService.instance;
      await isar.writeTxn(() async {
        await isar.lines.put(line);
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Линия «${line.name}» сохранена'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка сохранения: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Новая линия')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.science_outlined,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Заполните базовые данные проекта селекции. '
                          'Дата старта установится автоматически.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Название линии',
                  hintText: 'Например, «Чёрная искра»',
                  prefixIcon: Icon(Icons.label_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Введите название' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _targetTraitController,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                minLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Целевой признак',
                  hintText: 'Например, «Неоновая искра + веер»',
                  prefixIcon: Icon(Icons.flag_outlined),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Опишите целевой признак'
                    : null,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _saving ? null : _save,
                icon: _saving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save_outlined),
                label: Text(_saving ? 'Сохранение…' : 'Сохранить линию'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}