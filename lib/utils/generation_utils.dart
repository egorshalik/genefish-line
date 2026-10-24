import 'package:isar_community/isar.dart';
import '../databases/isar_service.dart';
import '../models/models.dart';

class GenerationUtils {
  /// Возвращает список поколений для выбора: P, F1..F{maxExisting+1}.
  static Future<List<String>> listForLine(int lineId) async {
    final isar = IsarService.instance;
    // Собираем все generation из рыб и помётов этой линии.
    final fishGens = (await isar.fishs
            .filter()
            .line((q) => q.idEqualTo(lineId))
            .findAll())
        .map((f) => f.generation);

    final litterGens = (await isar.litters
            .filter()
            .line((q) => q.idEqualTo(lineId))
            .findAll())
        .map((l) => l.generation);

    final all = <String>{...fishGens, ...litterGens};

    // Парсим F-номера.
    final fNumbers = <int>{};
    for (final g in all) {
      final match = RegExp(r'^F(\d+)$').firstMatch(g);
      if (match != null) {
        fNumbers.add(int.parse(match.group(1)!));
      }
    }

    final maxF = fNumbers.isEmpty ? 1 : fNumbers.reduce((a, b) => a > b ? a : b);
    // Всегда показываем минимум до F3 + одну следующую.
    final upper = (maxF + 1).clamp(3, 1 << 30);

    return [
      'P',
      for (var i = 1; i <= upper; i++) 'F$i',
    ];
  }
}