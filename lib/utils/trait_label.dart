import '../models/models.dart';

/// Возвращает человекочитаемое название целевого признака линии.
/// Если признак не задан — «Целевой признак».
String traitLabel(Line? line) {
  final t = line?.targetTrait.trim() ?? '';
  return t.isEmpty ? 'Целевой признак' : t;
}

/// Родительный падеж для конструкций «N рыб с <признаком>».
/// Простое решение: «с признаком «<название>»».
String traitWithGenitive(Line? line) {
  final t = line?.targetTrait.trim() ?? '';
  return t.isEmpty ? 'с целевым признаком' : 'с признаком «$t»';
}