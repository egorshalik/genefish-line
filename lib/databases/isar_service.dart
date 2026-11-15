import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/models.dart';

class IsarService {
  static Isar? _isar;

  static Isar get instance {
    if (_isar == null) {
      throw Exception('Isar не инициализирован! Вызовите IsarService.open() в main().');
    }
    return _isar!;
  }

  static Future<void> open() async {
    if (_isar != null) return; // Защита от повторного вызова

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [LineSchema, AnimalSchema, LitterSchema, TraitSchema],
      directory: dir.path,
      name: 'isar_db',
    );

    await _seedDefaultTraits(_isar!);
  }

  static Future<void> _seedDefaultTraits(Isar isar) async {
    final count = await isar.traits.count();
    if (count > 0) return;

    const defaults = [
      'Веер', 'Круглый хвост', 'Меч', 'Неон', 'Кобра', 'Смокинг', 'Солид',
    ];

    final traits = [
      for (var i = 0; i < defaults.length; i++)
        Trait()
          ..name = defaults[i]
          ..isBuiltIn = true
          ..sortOrder = i,
    ];

    await isar.writeTxn(() async {
      await isar.traits.putAll(traits);
    });
  }
}