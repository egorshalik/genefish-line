// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetAnimalCollection on Isar {
  IsarCollection<Animal> get animals => this.collection();
}

const AnimalSchema = CollectionSchema(
  name: r'Animal',
  id: 5509621733869852096,
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
      enumMap: _AnimalgenderEnumValueMap,
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

  estimateSize: _animalEstimateSize,
  serialize: _animalSerialize,
  deserialize: _animalDeserialize,
  deserializeProp: _animalDeserializeProp,
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
      id: -7397424448131510242,
      name: r'father',
      target: r'Animal',
      single: true,
    ),
    r'mother': LinkSchema(
      id: -1861680017354833422,
      name: r'mother',
      target: r'Animal',
      single: true,
    ),
    r'line': LinkSchema(
      id: -6538240621465727619,
      name: r'line',
      target: r'Line',
      single: true,
    ),
    r'originLitter': LinkSchema(
      id: -5885195957907408067,
      name: r'originLitter',
      target: r'Litter',
      single: true,
    ),
    r'species': LinkSchema(
      id: 8922518214292936434,
      name: r'species',
      target: r'Species',
      single: true,
    ),
  },
  embeddedSchemas: {},

  getId: _animalGetId,
  getLinks: _animalGetLinks,
  attach: _animalAttach,
  version: '3.4.1',
);

int _animalEstimateSize(
  Animal object,
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

void _animalSerialize(
  Animal object,
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

Animal _animalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Animal();
  object.customId = reader.readString(offsets[0]);
  object.gender =
      _AnimalgenderValueEnumMap[reader.readByteOrNull(offsets[1])] ??
      Gender.juvenile;
  object.generation = reader.readString(offsets[2]);
  object.hasTargetTrait = reader.readBool(offsets[3]);
  object.id = id;
  object.photoPath = reader.readStringOrNull(offsets[4]);
  object.traits = reader.readStringList(offsets[5]) ?? [];
  return object;
}

P _animalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_AnimalgenderValueEnumMap[reader.readByteOrNull(offset)] ??
              Gender.juvenile)
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

const _AnimalgenderEnumValueMap = {'juvenile': 0, 'male': 1, 'female': 2};
const _AnimalgenderValueEnumMap = {
  0: Gender.juvenile,
  1: Gender.male,
  2: Gender.female,
};

Id _animalGetId(Animal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animalGetLinks(Animal object) {
  return [
    object.father,
    object.mother,
    object.line,
    object.originLitter,
    object.species,
  ];
}

void _animalAttach(IsarCollection<dynamic> col, Id id, Animal object) {
  object.id = id;
  object.father.attach(col, col.isar.collection<Animal>(), r'father', id);
  object.mother.attach(col, col.isar.collection<Animal>(), r'mother', id);
  object.line.attach(col, col.isar.collection<Line>(), r'line', id);
  object.originLitter.attach(
    col,
    col.isar.collection<Litter>(),
    r'originLitter',
    id,
  );
  object.species.attach(col, col.isar.collection<Species>(), r'species', id);
}

extension AnimalByIndex on IsarCollection<Animal> {
  Future<Animal?> getByCustomId(String customId) {
    return getByIndex(r'customId', [customId]);
  }

  Animal? getByCustomIdSync(String customId) {
    return getByIndexSync(r'customId', [customId]);
  }

  Future<bool> deleteByCustomId(String customId) {
    return deleteByIndex(r'customId', [customId]);
  }

  bool deleteByCustomIdSync(String customId) {
    return deleteByIndexSync(r'customId', [customId]);
  }

  Future<List<Animal?>> getAllByCustomId(List<String> customIdValues) {
    final values = customIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'customId', values);
  }

  List<Animal?> getAllByCustomIdSync(List<String> customIdValues) {
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

  Future<Id> putByCustomId(Animal object) {
    return putByIndex(r'customId', object);
  }

  Id putByCustomIdSync(Animal object, {bool saveLinks = true}) {
    return putByIndexSync(r'customId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCustomId(List<Animal> objects) {
    return putAllByIndex(r'customId', objects);
  }

  List<Id> putAllByCustomIdSync(List<Animal> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'customId', objects, saveLinks: saveLinks);
  }
}

extension AnimalQueryWhereSort on QueryBuilder<Animal, Animal, QWhere> {
  QueryBuilder<Animal, Animal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimalQueryWhere on QueryBuilder<Animal, Animal, QWhereClause> {
  QueryBuilder<Animal, Animal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Animal, Animal, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> idBetween(
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

  QueryBuilder<Animal, Animal, QAfterWhereClause> customIdEqualTo(
    String customId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'customId', value: [customId]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> customIdNotEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterWhereClause> generationEqualTo(
    String generation,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'generation', value: [generation]),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterWhereClause> generationNotEqualTo(
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

extension AnimalQueryFilter on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'customId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> customIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'customId', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> genderEqualTo(
    Gender value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'gender', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> genderGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> genderLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> genderBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> generationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> hasTargetTraitEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasTargetTrait', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'photoPath'),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'photoPath', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementEqualTo(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementGreaterThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementLessThan(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementBetween(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementStartsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementEndsWith(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementContains(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementMatches(
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

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'traits', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition>
  traitsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'traits', value: ''),
      );
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', length, true, length, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, false, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', 0, true, length, include);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'traits', length, include, 999999, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> traitsLengthBetween(
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

extension AnimalQueryObject on QueryBuilder<Animal, Animal, QFilterCondition> {}

extension AnimalQueryLinks on QueryBuilder<Animal, Animal, QFilterCondition> {
  QueryBuilder<Animal, Animal, QAfterFilterCondition> father(
    FilterQuery<Animal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'father');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> fatherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'father', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> mother(
    FilterQuery<Animal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mother');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> motherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mother', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> line(
    FilterQuery<Line> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'line');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> lineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'line', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> originLitter(
    FilterQuery<Litter> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'originLitter');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> originLitterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'originLitter', 0, true, 0, true);
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> species(
    FilterQuery<Species> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'species');
    });
  }

  QueryBuilder<Animal, Animal, QAfterFilterCondition> speciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'species', 0, true, 0, true);
    });
  }
}

extension AnimalQuerySortBy on QueryBuilder<Animal, Animal, QSortBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByHasTargetTraitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension AnimalQuerySortThenBy on QueryBuilder<Animal, Animal, QSortThenBy> {
  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByHasTargetTraitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTargetTrait', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<Animal, Animal, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension AnimalQueryWhereDistinct on QueryBuilder<Animal, Animal, QDistinct> {
  QueryBuilder<Animal, Animal, QDistinct> distinctByCustomId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByGeneration({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByHasTargetTrait() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasTargetTrait');
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByPhotoPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Animal, Animal, QDistinct> distinctByTraits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'traits');
    });
  }
}

extension AnimalQueryProperty on QueryBuilder<Animal, Animal, QQueryProperty> {
  QueryBuilder<Animal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> customIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customId');
    });
  }

  QueryBuilder<Animal, Gender, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Animal, String, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Animal, bool, QQueryOperations> hasTargetTraitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasTargetTrait');
    });
  }

  QueryBuilder<Animal, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<Animal, List<String>, QQueryOperations> traitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'traits');
    });
  }
}
