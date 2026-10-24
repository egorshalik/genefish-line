import 'package:isar_community/isar.dart';

part 'trait.g.dart';

/// Тег внешности. Пользователь может добавлять свои.
@Collection()
class Trait {
  Id id = Isar.autoIncrement;

  /// Отображаемое название, например «Веер», «Кобра».
  @Index(unique: true, replace: false)
  String name = '';

  /// Базовый тег из стартового набора (нельзя удалить).
  bool isBuiltIn = false;

  /// Порядок в UI. Базовые — 0..N, пользовательские — по порядку добавления.
  int sortOrder = 0;

  Trait();
}