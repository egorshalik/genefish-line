// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetFishCollection on Isar {
  IsarCollection<Fish> get fishs => this.collection();
}

const FishSchema = CollectionSchema(
  name: r'Fish',
  id: -8462330926124391444,
  properties: {
    r'customId': PropertySchema(
      id: 0,
      name: r'customId',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 1,
      name: r'gender',
      type: IsarType.byte,
      enumMap: _FishgenderEnumValueMap,
    ),
    r'generation': PropertySchema(
      id: 2,
      name: r'generation',
      type: IsarType.string,
    ),
    r'hasTargetTrait': PropertySchema(
      id: 3,
      name: r'hasTargetTrait',
      type: IsarType.bool,
    ),
    r'photoPath': PropertySchema(
      id: 4,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'traits': PropertySchema(
      id: 5,
      name: r'traits',
      type: IsarType.stringList,
    ),
  },

  estimateSize: _fishEstimateSize,
  serialize: _fishSerialize,
  deserialize: _fishDeserialize,
  deserializeProp: _fishDeserializeProp,
  idName: r'id',
  indexes: {
    r'customId': IndexSchema(
      id: -7523974382886476007,
      name: r'customId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'customId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'generation': IndexSchema(
      id: 8069717607491552056,
      name: r'generation',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'generation',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'father': LinkSchema(
      id: -2739246060429714794,
      name: r'father',
      target: r'Fish',
      single: true,
    ),
    r'mother': LinkSchema(
      id: -5016545872096262813,
      name: r'mother',
      target: r'Fish',
      single: true,
    ),
    r'line': LinkSchema(
      id: -6690507729304574000,
      name: r'line',
      target: r'Line',
      single: true,
    ),
    r'originLitter': LinkSchema(
      id: 5420932225626785972,
      name: r'originLitter',
      target: r'Litter',
      single: true,
    ),
  },
  embeddedSchemas: {},

  getId: _fishGetId,
  getLinks: _fishGetLinks,
  attach: _fishAttach,
  version: '3.4.1',
);

int _fishEstimateSize(
  Fish object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customId.length * 3;
  bytesCount += 3 + object.generation.length * 3;
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.traits.length * 3;
  {
    for (var i = 0; i < object.traits.length; i++) {
      final value = object.traits[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _fishSerialize(
  Fish object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.customId);
  writer.writeByte(offsets[1], object.gender.index);
  writer.writeString(offsets[2], object.generation);
  writer.writeBool(offsets[3], object.hasTargetTrait);
  writer.writeString(offsets[4], object.photoPath);
  writer.writeStringList(offsets[5], object.traits);
}

Fish _fishDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Fish();
  object.customId = reader.readString(offsets[0]);
  object.gender =
      _FishgenderValueEnumMap[reader.readByteOrNull(offsets[1])] ?? Gender.fry;
  object.generation = reader.readString(offsets[2]);
  object.hasTargetTrait = reader.readBool(offsets[3]);
  object.id = id;
  object.photoPath = reader.readStringOrNull(offsets[4]);
  object.traits = reader.readStringList(offsets[5]) ?? [];
  return object;
}

P _fishDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_FishgenderValueEnumMap[reader.readByteOrNull(offset)] ??
              Gender.fry)
          as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FishgenderEnumValueMap = {'fry': 0, 'male': 1, 'female': 2};
const _FishgenderValueEnumMap = {
  0: Gender.fry,
  1: Gender.male,
  2: Gender.female,
};

Id _fishGetId(Fish object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fishGetLinks(Fish object) {
  return [object.father, object.mother, object.line, object.originLitter];
}

void _fishAttach(IsarCollection<dynamic> col, Id id, Fish object) {
  object.id = id;
  object.father.attach(col, col.isar.collection<Fish>(), r'father', id);
  object.mother.attach(col, col.isar.collection<Fish>(), r'mother', id);
  object.line.attach(col, col.isar.collection<Line>(), r'line', id);
  object.originLitter.attach(
    col,
    col.isar.collection<Litter>(),
    r'originLitter',
    id,
  );
}

extension FishByIndex on IsarCollection<Fish> {
  Future<Fish?> getByCustomId(String customId) {
    return getByIndex(r'customId', [customId]);
  }

  Fish? getByCustomIdSync(String customId) {
    return getByIndexSync(r'customId', [customId]);
  }

  Future<bool> deleteByCustomId(String customId) {
    return deleteByIndex(r'customId', [customId]);
  }

  bool deleteByCustomIdSync(String customId) {
    return deleteByIndexSync(r'customId', [customId]);
  }

  Future<List<Fish?>> getAllByCustomId(List<String> customIdValues) {
    final values = customIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'customId', values);
  }

  List<Fish?> getAllByCustomIdSync(List<String> customIdValues) {
    final values = customIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'customId', values);
  }

  Future<int> deleteAllByCustomId(List<String> customIdValues) {
    final values = customIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'customId', values);
  }

  int deleteAllByCustomIdSync(List<String> customIdValues) {
    final values = customIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'customId', values);
  }

  Future<Id> putByCustomId(Fish object) {
    return putByIndex(r'customId', object);
  }

  Id putByCustomIdSync(Fish object, {bool saveLinks = true}) {
    return putByIndexSync(r'customId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCustomId(List<Fish> objects) {
    return putAllByIndex(r'customId', objects);
  }

  List<Id> putAllByCustomIdSync(List<Fish> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'customId', objects, saveLinks: saveLinks);
  }
}

extension FishQueryWhereSort on QueryBuilder<Fish, Fish, QWhere> {
  QueryBuilder<Fish, Fish, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FishQueryWhere on QueryBuilder<Fish, Fish, QWhereClause> {
  QueryBuilder<Fish, Fish, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> customIdEqualTo(String customId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'customId', value: [customId]),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> customIdNotEqualTo(
    String customId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customId',
                lower: [],
                upper: [customId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customId',
                lower: [customId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customId',
                lower: [customId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'customId',
                lower: [],
                upper: [customId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> generationEqualTo(
    String generation,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'generation', value: [generation]),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterWhereClause> generationNotEqualTo(
    String generation,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generation',
                lower: [],
                upper: [generation],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generation',
                lower: [generation],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generation',
                lower: [generation],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'generation',
                lower: [],
                upper: [generation],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension FishQueryFilter on QueryBuilder<Fish, Fish, QFilterCondition> {
  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'customId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'customId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'customId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customId', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> customIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customId', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> genderEqualTo(Gender value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gender', value: value),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> genderGreaterThan(
    Gender value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'gender',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> genderLessThan(
    Gender value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'gender',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> genderBetween(
    Gender lower,
    Gender upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'gender',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'generation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'generation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'generation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> generationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> hasTargetTraitEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasTargetTrait', value: value),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'photoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'photoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'photoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'traits',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'traits',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'traits',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'traits', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'traits', value: ''),
      );
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', length, true, length, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, true, 0, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, false, 999999, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, true, length, include);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', length, include, 999999, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> traitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traits',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FishQueryObject on QueryBuilder<Fish, Fish, QFilterCondition> {}

extension FishQueryLinks on QueryBuilder<Fish, Fish, QFilterCondition> {
  QueryBuilder<Fish, Fish, QAfterFilterCondition> father(FilterQuery<Fish> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'father');
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> fatherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'father', 0, true, 0, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> mother(FilterQuery<Fish> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mother');
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> motherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mother', 0, true, 0, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> line(FilterQuery<Line> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'line');
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> lineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'line', 0, true, 0, true);
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> originLitter(
    FilterQuery<Litter> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'originLitter');
    });
  }

  QueryBuilder<Fish, Fish, QAfterFilterCondition> originLitterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'originLitter', 0, true, 0, true);
    });
  }
}

extension FishQuerySortBy on QueryBuilder<Fish, Fish, QSortBy> {
  QueryBuilder<Fish, Fish, QAfterSortBy> sortByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByHasTargetTraitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension FishQuerySortThenBy on QueryBuilder<Fish, Fish, QSortThenBy> {
  QueryBuilder<Fish, Fish, QAfterSortBy> thenByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByHasTargetTraitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Fish, Fish, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension FishQueryWhereDistinct on QueryBuilder<Fish, Fish, QDistinct> {
  QueryBuilder<Fish, Fish, QDistinct> distinctByCustomId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Fish, Fish, QDistinct> distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<Fish, Fish, QDistinct> distinctByGeneration({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Fish, Fish, QDistinct> distinctByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasTargetTrait');
    });
  }

  QueryBuilder<Fish, Fish, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Fish, Fish, QDistinct> distinctByTraits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'traits');
    });
  }
}

extension FishQueryProperty on QueryBuilder<Fish, Fish, QQueryProperty> {
  QueryBuilder<Fish, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Fish, String, QQueryOperations> customIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customId');
    });
  }

  QueryBuilder<Fish, Gender, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Fish, String, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Fish, bool, QQueryOperations> hasTargetTraitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasTargetTrait');
    });
  }

  QueryBuilder<Fish, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<Fish, List<String>, QQueryOperations> traitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'traits');
    });
  }
}
