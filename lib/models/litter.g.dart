// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'litter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types, experimental_member_use

extension GetLitterCollection on Isar {
  IsarCollection<Litter> get litters => this.collection();
}

const LitterSchema = CollectionSchema(
  name: r'Litter',
  id: 6303076082712281876,
  properties: {
    r'birthDate': PropertySchema(
      id: 0,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'generation': PropertySchema(
      id: 1,
      name: r'generation',
      type: IsarType.string,
    ),
    r'targetCount': PropertySchema(
      id: 2,
      name: r'targetCount',
      type: IsarType.long,
    ),
    r'targetPercentage': PropertySchema(
      id: 3,
      name: r'targetPercentage',
      type: IsarType.double,
    ),
    r'totalCount': PropertySchema(
      id: 4,
      name: r'totalCount',
      type: IsarType.long,
    ),
  },

  estimateSize: _litterEstimateSize,
  serialize: _litterSerialize,
  deserialize: _litterDeserialize,
  deserializeProp: _litterDeserializeProp,
  idName: r'id',
  indexes: {
    r'birthDate': IndexSchema(
      id: -6248906684002595105,
      name: r'birthDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'birthDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {
    r'line': LinkSchema(
      id: -72254581321585342,
      name: r'line',
      target: r'Line',
      single: true,
    ),
    r'father': LinkSchema(
      id: 4594081357830673670,
      name: r'father',
      target: r'Fish',
      single: true,
    ),
    r'mother': LinkSchema(
      id: -914835966556334609,
      name: r'mother',
      target: r'Fish',
      single: true,
    ),
  },
  embeddedSchemas: {},

  getId: _litterGetId,
  getLinks: _litterGetLinks,
  attach: _litterAttach,
  version: '3.4.1',
);

int _litterEstimateSize(
  Litter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.generation.length * 3;
  return bytesCount;
}

void _litterSerialize(
  Litter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.birthDate);
  writer.writeString(offsets[1], object.generation);
  writer.writeLong(offsets[2], object.targetCount);
  writer.writeDouble(offsets[3], object.targetPercentage);
  writer.writeLong(offsets[4], object.totalCount);
}

Litter _litterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Litter();
  object.birthDate = reader.readDateTime(offsets[0]);
  object.generation = reader.readString(offsets[1]);
  object.id = id;
  object.targetCount = reader.readLong(offsets[2]);
  object.totalCount = reader.readLong(offsets[4]);
  return object;
}

P _litterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _litterGetId(Litter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _litterGetLinks(Litter object) {
  return [object.line, object.father, object.mother];
}

void _litterAttach(IsarCollection<dynamic> col, Id id, Litter object) {
  object.id = id;
  object.line.attach(col, col.isar.collection<Line>(), r'line', id);
  object.father.attach(col, col.isar.collection<Fish>(), r'father', id);
  object.mother.attach(col, col.isar.collection<Fish>(), r'mother', id);
}

extension LitterQueryWhereSort on QueryBuilder<Litter, Litter, QWhere> {
  QueryBuilder<Litter, Litter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhere> anyBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'birthDate'),
      );
    });
  }
}

extension LitterQueryWhere on QueryBuilder<Litter, Litter, QWhereClause> {
  QueryBuilder<Litter, Litter, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Litter, Litter, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> idBetween(
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

  QueryBuilder<Litter, Litter, QAfterWhereClause> birthDateEqualTo(
    DateTime birthDate,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'birthDate', value: [birthDate]),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> birthDateNotEqualTo(
    DateTime birthDate,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'birthDate',
                lower: [],
                upper: [birthDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'birthDate',
                lower: [birthDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'birthDate',
                lower: [birthDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'birthDate',
                lower: [],
                upper: [birthDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> birthDateGreaterThan(
    DateTime birthDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'birthDate',
          lower: [birthDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> birthDateLessThan(
    DateTime birthDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'birthDate',
          lower: [],
          upper: [birthDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterWhereClause> birthDateBetween(
    DateTime lowerBirthDate,
    DateTime upperBirthDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'birthDate',
          lower: [lowerBirthDate],
          includeLower: includeLower,
          upper: [upperBirthDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LitterQueryFilter on QueryBuilder<Litter, Litter, QFilterCondition> {
  QueryBuilder<Litter, Litter, QAfterFilterCondition> birthDateEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'birthDate', value: value),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> birthDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'birthDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> birthDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'birthDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> birthDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'birthDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationEqualTo(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationGreaterThan(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationLessThan(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationBetween(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationStartsWith(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationEndsWith(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationContains(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationMatches(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> generationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'generation', value: ''),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'targetCount', value: value),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetPercentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'targetPercentage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition>
  targetPercentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetPercentage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetPercentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetPercentage',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> targetPercentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetPercentage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> totalCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalCount', value: value),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> totalCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> totalCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> totalCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LitterQueryObject on QueryBuilder<Litter, Litter, QFilterCondition> {}

extension LitterQueryLinks on QueryBuilder<Litter, Litter, QFilterCondition> {
  QueryBuilder<Litter, Litter, QAfterFilterCondition> line(
    FilterQuery<Line> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'line');
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> lineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'line', 0, true, 0, true);
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> father(
    FilterQuery<Fish> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'father');
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> fatherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'father', 0, true, 0, true);
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> mother(
    FilterQuery<Fish> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'mother');
    });
  }

  QueryBuilder<Litter, Litter, QAfterFilterCondition> motherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'mother', 0, true, 0, true);
    });
  }
}

extension LitterQuerySortBy on QueryBuilder<Litter, Litter, QSortBy> {
  QueryBuilder<Litter, Litter, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTargetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCount', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTargetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCount', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTargetPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPercentage', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTargetPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPercentage', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> sortByTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.desc);
    });
  }
}

extension LitterQuerySortThenBy on QueryBuilder<Litter, Litter, QSortThenBy> {
  QueryBuilder<Litter, Litter, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByGeneration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByGenerationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generation', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTargetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCount', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTargetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCount', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTargetPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPercentage', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTargetPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetPercentage', Sort.desc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.asc);
    });
  }

  QueryBuilder<Litter, Litter, QAfterSortBy> thenByTotalCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCount', Sort.desc);
    });
  }
}

extension LitterQueryWhereDistinct on QueryBuilder<Litter, Litter, QDistinct> {
  QueryBuilder<Litter, Litter, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<Litter, Litter, QDistinct> distinctByGeneration({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Litter, Litter, QDistinct> distinctByTargetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCount');
    });
  }

  QueryBuilder<Litter, Litter, QDistinct> distinctByTargetPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetPercentage');
    });
  }

  QueryBuilder<Litter, Litter, QDistinct> distinctByTotalCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCount');
    });
  }
}

extension LitterQueryProperty on QueryBuilder<Litter, Litter, QQueryProperty> {
  QueryBuilder<Litter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Litter, DateTime, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<Litter, String, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Litter, int, QQueryOperations> targetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCount');
    });
  }

  QueryBuilder<Litter, double, QQueryOperations> targetPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetPercentage');
    });
  }

  QueryBuilder<Litter, int, QQueryOperations> totalCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCount');
    });
  }
}
