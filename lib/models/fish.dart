import 'package:isar/isar.dart';

import 'line.dart';
import 'litter.dart';

part 'fish.g.dart';

enum Gender { fry, male, female }

@Collection()
class Fish {
  Id id = Isar.autoIncrement;

  /// Человекочитаемый ID, например F1-M-1
  @Index(unique: true, replace: false)
  String customId = '';

  @Index()
  String generation = 'P';

  @Enumerated(EnumType.ordinal)
  Gender gender = Gender.fry;

  String? photoPath;

  List<String> traits = [];

  bool hasTargetTrait  = false;

  // Генеалогия
  final father = IsarLink<Fish>();
  final mother = IsarLink<Fish>();

  // Принадлежность
  final line = IsarLink<Line>();

  // Из какого помёта (опционально)
  final originLitter = IsarLink<Litter>();

  Fish();
}