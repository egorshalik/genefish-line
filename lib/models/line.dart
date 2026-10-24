import 'package:isar_community/isar.dart';

import 'fish.dart';
import 'litter.dart';

part 'line.g.dart';

/// Селекционная линия (проект).
@Collection()
class Line {
  Id id = Isar.autoIncrement;

  @Index(unique: false, replace: false)
  String name = '';

  String targetTrait = '';

  @Index()
  DateTime startDate = DateTime.now();

  bool isCompleted = false;

  @Backlink(to: 'line')
  final fishes = IsarLinks<Fish>();

  @Backlink(to: 'line')
  final litters = IsarLinks<Litter>();

  Line();
}