import 'package:isar_community/isar.dart';

import 'fish.dart';
import 'line.dart';

part 'litter.g.dart';

@Collection()
class Litter {
  Id id = Isar.autoIncrement;

  @Index()
  DateTime birthDate = DateTime.now();

  String generation = 'F1';

  int totalCount = 0;
  int targetCount  = 0;

  double get targetPercentage =>
      totalCount > 0 ? (targetCount  / totalCount) * 100 : 0.0;

  final line = IsarLink<Line>();
  final father = IsarLink<Fish>();
  final mother = IsarLink<Fish>();

  Litter();
}