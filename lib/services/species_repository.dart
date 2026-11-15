import 'package:isar_community/isar.dart';
import '../databases/isar_service.dart';
import '../models/models.dart';
import 'wikipedia_client.dart';
import 'gbif_client.dart';

class SpeciesRepository {
  final isar = IsarService.instance;
  final _wikiClient = WikipediaClient();
  final _gbifClient = GbifClient();

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

  Future<bool> isValidAnimal(String name) async {
    return await _gbifClient.isAnimal(name);
  }

  Future<void> fetchInfo(Species species) async {
    species.infoStatus = SpeciesInfoStatus.loading;
    species.infoError = null;
    await isar.writeTxn(() => isar.species.put(species));

    try {
      final wiki = await _wikiClient.lookup(species.commonName);
      final gbif = await _gbifClient.match(species.commonName);

      species.description = wiki?.extract;
      if (gbif != null) {
        species.latinName = gbif.latinName;
        species.genus = gbif.genus;
        species.family = gbif.family;
        species.className = gbif.className;
      }

      if (wiki == null && gbif == null) {
        throw Exception('Данные не найдены в Википедии и GBIF');
      }

      species.infoStatus = SpeciesInfoStatus.loaded;
      species.infoFetchedAt = DateTime.now();
    } catch (e) {
      species.infoStatus = SpeciesInfoStatus.failed;
      species.infoError = e.toString();
    }

    await isar.writeTxn(() => isar.species.put(species));
  }
}