import 'package:isar_community/isar.dart';

part 'species.g.dart';

enum SpeciesInfoStatus { none, loading, loaded, failed }

@Collection()
class Species {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true, caseSensitive: false)
  String commonName = '';

  String? latinName;
  String? genus;
  String? family;
  String? className;
  String? description;

  @Enumerated(EnumType.ordinal)
  SpeciesInfoStatus infoStatus = SpeciesInfoStatus.none;

  DateTime? infoFetchedAt;
  String? infoError;

  Species();
}