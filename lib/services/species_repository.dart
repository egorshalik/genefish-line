import 'package:isar_community/isar.dart';
import '../databases/isar_service.dart';
import '../models/models.dart';

class SpeciesRepository {
  final isar = IsarService.instance;

  Future<Species> getOrCreate(String name) async {
    final normalized = name.trim();
    if (normalized.isEmpty) {
      throw ArgumentError('Название вида не может быть пустым');
    }

    final existingSpecies = await isar.species
        .filter()
        .commonNameEqualTo(normalized, caseSensitive: false)
        .findFirst();

    if (existingSpecies != null) return existingSpecies;

    final newSpecies = Species()..commonName = normalized;
    
    await isar.writeTxn(() async {
      await isar.species.put(newSpecies);
    });
    
    return newSpecies;
  }
}