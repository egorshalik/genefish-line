import 'package:isar_community/isar.dart';

import 'line.dart';
import 'litter.dart';
import 'species.dart';

part 'animal.g.dart';

enum Gender { juvenile, male, female }

@Collection()
class Animal {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: false)
  String customId = '';

  @Index()
  String generation = 'P';

  @Enumerated(EnumType.ordinal)
  Gender gender = Gender.juvenile;

  String? photoPath;

  List<String> traits = [];

  bool hasTargetTrait = false;

  final father = IsarLink<Animal>();
  final mother = IsarLink<Animal>();

  final line = IsarLink<Line>();

  final originLitter = IsarLink<Litter>();
  final species = IsarLink<Species>();
  
  Animal();
}