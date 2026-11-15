// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetSpeciesCollection on Isar {
  IsarCollection<Species> get species => this.collection();
}

const SpeciesSchema = CollectionSchema(
  name: r'Species',
  id: -1724512414814962385,
  properties: {
    r'className': PropertySchema(
      id: 0,
      name: r'className',
      type: IsarType.string,
    ),
    r'commonName': PropertySchema(
      id: 1,
      name: r'commonName',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'family': PropertySchema(id: 3, name: r'family', type: IsarType.string),
    r'genus': PropertySchema(id: 4, name: r'genus', type: IsarType.string),
    r'infoError': PropertySchema(
      id: 5,
      name: r'infoError',
      type: IsarType.string,
    ),
    r'infoFetchedAt': PropertySchema(
      id: 6,
      name: r'infoFetchedAt',
      type: IsarType.dateTime,
    ),
    r'infoStatus': PropertySchema(
      id: 7,
      name: r'infoStatus',
      type: IsarType.byte,
      enumMap: _SpeciesinfoStatusEnumValueMap,
    ),
    r'latinName': PropertySchema(
      id: 8,
      name: r'latinName',
      type: IsarType.string,
    ),
  },

  estimateSize: _speciesEstimateSize,
  serialize: _speciesSerialize,
  deserialize: _speciesDeserialize,
  deserializeProp: _speciesDeserializeProp,
  idName: r'id',
  indexes: {
    r'commonName': IndexSchema(
      id: -5029519833804736586,
      name: r'commonName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'commonName',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _speciesGetId,
  getLinks: _speciesGetLinks,
  attach: _speciesAttach,
  version: '3.4.1',
);

int _speciesEstimateSize(
  Species object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.className;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.commonName.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.family;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.genus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.infoError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.latinName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _speciesSerialize(
  Species object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.className);
  writer.writeString(offsets[1], object.commonName);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.family);
  writer.writeString(offsets[4], object.genus);
  writer.writeString(offsets[5], object.infoError);
  writer.writeDateTime(offsets[6], object.infoFetchedAt);
  writer.writeByte(offsets[7], object.infoStatus.index);
  writer.writeString(offsets[8], object.latinName);
}

Species _speciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Species();
  object.className = reader.readStringOrNull(offsets[0]);
  object.commonName = reader.readString(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.family = reader.readStringOrNull(offsets[3]);
  object.genus = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.infoError = reader.readStringOrNull(offsets[5]);
  object.infoFetchedAt = reader.readDateTimeOrNull(offsets[6]);
  object.infoStatus =
      _SpeciesinfoStatusValueEnumMap[reader.readByteOrNull(offsets[7])] ??
      SpeciesInfoStatus.none;
  object.latinName = reader.readStringOrNull(offsets[8]);
  return object;
}

P _speciesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_SpeciesinfoStatusValueEnumMap[reader.readByteOrNull(offset)] ??
              SpeciesInfoStatus.none)
          as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SpeciesinfoStatusEnumValueMap = {
  'none': 0,
  'loading': 1,
  'loaded': 2,
  'failed': 3,
};
const _SpeciesinfoStatusValueEnumMap = {
  0: SpeciesInfoStatus.none,
  1: SpeciesInfoStatus.loading,
  2: SpeciesInfoStatus.loaded,
  3: SpeciesInfoStatus.failed,
};

Id _speciesGetId(Species object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _speciesGetLinks(Species object) {
  return [];
}

void _speciesAttach(IsarCollection<dynamic> col, Id id, Species object) {
  object.id = id;
}

extension SpeciesByIndex on IsarCollection<Species> {
  Future<Species?> getByCommonName(String commonName) {
    return getByIndex(r'commonName', [commonName]);
  }

  Species? getByCommonNameSync(String commonName) {
    return getByIndexSync(r'commonName', [commonName]);
  }

  Future<bool> deleteByCommonName(String commonName) {
    return deleteByIndex(r'commonName', [commonName]);
  }

  bool deleteByCommonNameSync(String commonName) {
    return deleteByIndexSync(r'commonName', [commonName]);
  }

  Future<List<Species?>> getAllByCommonName(List<String> commonNameValues) {
    final values = commonNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'commonName', values);
  }

  List<Species?> getAllByCommonNameSync(List<String> commonNameValues) {
    final values = commonNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'commonName', values);
  }

  Future<int> deleteAllByCommonName(List<String> commonNameValues) {
    final values = commonNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'commonName', values);
  }

  int deleteAllByCommonNameSync(List<String> commonNameValues) {
    final values = commonNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'commonName', values);
  }

  Future<Id> putByCommonName(Species object) {
    return putByIndex(r'commonName', object);
  }

  Id putByCommonNameSync(Species object, {bool saveLinks = true}) {
    return putByIndexSync(r'commonName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCommonName(List<Species> objects) {
    return putAllByIndex(r'commonName', objects);
  }

  List<Id> putAllByCommonNameSync(
    List<Species> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'commonName', objects, saveLinks: saveLinks);
  }
}

extension SpeciesQueryWhereSort on QueryBuilder<Species, Species, QWhere> {
  QueryBuilder<Species, Species, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SpeciesQueryWhere on QueryBuilder<Species, Species, QWhereClause> {
  QueryBuilder<Species, Species, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Species, Species, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> idBetween(
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

  QueryBuilder<Species, Species, QAfterWhereClause> commonNameEqualTo(
    String commonName,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'commonName', value: [commonName]),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterWhereClause> commonNameNotEqualTo(
    String commonName,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'commonName',
                lower: [],
                upper: [commonName],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'commonName',
                lower: [commonName],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'commonName',
                lower: [commonName],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'commonName',
                lower: [],
                upper: [commonName],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension SpeciesQueryFilter
    on QueryBuilder<Species, Species, QFilterCondition> {
  QueryBuilder<Species, Species, QAfterFilterCondition> classNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'className'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'className'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'className',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'className',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'className', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> classNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'className', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'commonName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'commonName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'commonName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'commonName', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> commonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'commonName', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'family'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'family'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'family',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'family',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'family',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'family', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> familyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'family', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'genus'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'genus'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genus', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> genusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genus', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'infoError'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'infoError'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'infoError',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'infoError',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'infoError',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'infoError', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'infoError', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoFetchedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'infoFetchedAt'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
  infoFetchedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'infoFetchedAt'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoFetchedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'infoFetchedAt', value: value),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition>
  infoFetchedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'infoFetchedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoFetchedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'infoFetchedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoFetchedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'infoFetchedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoStatusEqualTo(
    SpeciesInfoStatus value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'infoStatus', value: value),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoStatusGreaterThan(
    SpeciesInfoStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'infoStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoStatusLessThan(
    SpeciesInfoStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'infoStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> infoStatusBetween(
    SpeciesInfoStatus lower,
    SpeciesInfoStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'infoStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'latinName'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'latinName'),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'latinName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'latinName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'latinName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'latinName', value: ''),
      );
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> latinNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'latinName', value: ''),
      );
    });
  }
}

extension SpeciesQueryObject
    on QueryBuilder<Species, Species, QFilterCondition> {}

extension SpeciesQueryLinks
    on QueryBuilder<Species, Species, QFilterCondition> {}

extension SpeciesQuerySortBy on QueryBuilder<Species, Species, QSortBy> {
  QueryBuilder<Species, Species, QAfterSortBy> sortByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'family', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'family', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByGenus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genus', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByGenusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genus', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoError', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoError', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoFetchedAt', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoFetchedAt', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoStatus', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByInfoStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoStatus', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLatinName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latinName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> sortByLatinNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latinName', Sort.desc);
    });
  }
}

extension SpeciesQuerySortThenBy
    on QueryBuilder<Species, Species, QSortThenBy> {
  QueryBuilder<Species, Species, QAfterSortBy> thenByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'family', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'family', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByGenus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genus', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByGenusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genus', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoError', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoError', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoFetchedAt', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoFetchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoFetchedAt', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoStatus', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByInfoStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infoStatus', Sort.desc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLatinName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latinName', Sort.asc);
    });
  }

  QueryBuilder<Species, Species, QAfterSortBy> thenByLatinNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latinName', Sort.desc);
    });
  }
}

extension SpeciesQueryWhereDistinct
    on QueryBuilder<Species, Species, QDistinct> {
  QueryBuilder<Species, Species, QDistinct> distinctByClassName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'className', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByCommonName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByFamily({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'family', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByGenus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByInfoError({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByInfoFetchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoFetchedAt');
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByInfoStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infoStatus');
    });
  }

  QueryBuilder<Species, Species, QDistinct> distinctByLatinName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latinName', caseSensitive: caseSensitive);
    });
  }
}

extension SpeciesQueryProperty
    on QueryBuilder<Species, Species, QQueryProperty> {
  QueryBuilder<Species, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> classNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'className');
    });
  }

  QueryBuilder<Species, String, QQueryOperations> commonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonName');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> familyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'family');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> genusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genus');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> infoErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoError');
    });
  }

  QueryBuilder<Species, DateTime?, QQueryOperations> infoFetchedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoFetchedAt');
    });
  }

  QueryBuilder<Species, SpeciesInfoStatus, QQueryOperations>
  infoStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoStatus');
    });
  }

  QueryBuilder<Species, String?, QQueryOperations> latinNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latinName');
    });
  }
}
