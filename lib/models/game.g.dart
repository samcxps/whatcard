// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GameCollectionReference
    implements
        GameQuery,
        FirestoreCollectionReference<Game, GameQuerySnapshot> {
  factory GameCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GameCollectionReference;

  static Game fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Game.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Game value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Game> get reference;

  @override
  GameDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GameDocumentReference> add(Game value);
}

class _$GameCollectionReference extends _$GameQuery
    implements GameCollectionReference {
  factory _$GameCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GameCollectionReference._(
      firestore.collection('games').withConverter(
            fromFirestore: GameCollectionReference.fromFirestore,
            toFirestore: GameCollectionReference.toFirestore,
          ),
    );
  }

  _$GameCollectionReference._(
    CollectionReference<Game> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Game> get reference =>
      super.reference as CollectionReference<Game>;

  @override
  GameDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GameDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GameDocumentReference> add(Game value) {
    return reference.add(value).then((ref) => GameDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GameDocumentReference
    extends FirestoreDocumentReference<Game, GameDocumentSnapshot> {
  factory GameDocumentReference(DocumentReference<Game> reference) =
      _$GameDocumentReference;

  DocumentReference<Game> get reference;

  /// A reference to the [GameCollectionReference] containing this document.
  GameCollectionReference get parent {
    return _$GameCollectionReference(reference.firestore);
  }

  @override
  Stream<GameDocumentSnapshot> snapshots();

  @override
  Future<GameDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String gameId,
    FieldValue gameIdFieldValue,
    DateTime createdTime,
    FieldValue createdTimeFieldValue,
    String joinCode,
    FieldValue joinCodeFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
    String cardPack,
    FieldValue cardPackFieldValue,
    int cardAmount,
    FieldValue cardAmountFieldValue,
    List<String> playerIds,
    FieldValue playerIdsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String gameId,
    FieldValue gameIdFieldValue,
    DateTime createdTime,
    FieldValue createdTimeFieldValue,
    String joinCode,
    FieldValue joinCodeFieldValue,
    String displayName,
    FieldValue displayNameFieldValue,
    String cardPack,
    FieldValue cardPackFieldValue,
    int cardAmount,
    FieldValue cardAmountFieldValue,
    List<String> playerIds,
    FieldValue playerIdsFieldValue,
  });
}

class _$GameDocumentReference
    extends FirestoreDocumentReference<Game, GameDocumentSnapshot>
    implements GameDocumentReference {
  _$GameDocumentReference(this.reference);

  @override
  final DocumentReference<Game> reference;

  /// A reference to the [GameCollectionReference] containing this document.
  GameCollectionReference get parent {
    return _$GameCollectionReference(reference.firestore);
  }

  @override
  Stream<GameDocumentSnapshot> snapshots() {
    return reference.snapshots().map(GameDocumentSnapshot._);
  }

  @override
  Future<GameDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GameDocumentSnapshot._);
  }

  @override
  Future<GameDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GameDocumentSnapshot._);
  }

  Future<void> update({
    Object? gameId = _sentinel,
    FieldValue? gameIdFieldValue,
    Object? createdTime = _sentinel,
    FieldValue? createdTimeFieldValue,
    Object? joinCode = _sentinel,
    FieldValue? joinCodeFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? cardPack = _sentinel,
    FieldValue? cardPackFieldValue,
    Object? cardAmount = _sentinel,
    FieldValue? cardAmountFieldValue,
    Object? playerIds = _sentinel,
    FieldValue? playerIdsFieldValue,
  }) async {
    assert(
      gameId == _sentinel || gameIdFieldValue == null,
      "Cannot specify both gameId and gameIdFieldValue",
    );
    assert(
      createdTime == _sentinel || createdTimeFieldValue == null,
      "Cannot specify both createdTime and createdTimeFieldValue",
    );
    assert(
      joinCode == _sentinel || joinCodeFieldValue == null,
      "Cannot specify both joinCode and joinCodeFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      cardPack == _sentinel || cardPackFieldValue == null,
      "Cannot specify both cardPack and cardPackFieldValue",
    );
    assert(
      cardAmount == _sentinel || cardAmountFieldValue == null,
      "Cannot specify both cardAmount and cardAmountFieldValue",
    );
    assert(
      playerIds == _sentinel || playerIdsFieldValue == null,
      "Cannot specify both playerIds and playerIdsFieldValue",
    );
    final json = {
      if (gameId != _sentinel) _$$_GameFieldMap['gameId']!: gameId as String,
      if (gameIdFieldValue != null)
        _$$_GameFieldMap['gameId']!: gameIdFieldValue,
      if (createdTime != _sentinel)
        _$$_GameFieldMap['createdTime']!: createdTime as DateTime,
      if (createdTimeFieldValue != null)
        _$$_GameFieldMap['createdTime']!: createdTimeFieldValue,
      if (joinCode != _sentinel)
        _$$_GameFieldMap['joinCode']!: joinCode as String,
      if (joinCodeFieldValue != null)
        _$$_GameFieldMap['joinCode']!: joinCodeFieldValue,
      if (displayName != _sentinel)
        _$$_GameFieldMap['displayName']!: displayName as String,
      if (displayNameFieldValue != null)
        _$$_GameFieldMap['displayName']!: displayNameFieldValue,
      if (cardPack != _sentinel)
        _$$_GameFieldMap['cardPack']!: cardPack as String,
      if (cardPackFieldValue != null)
        _$$_GameFieldMap['cardPack']!: cardPackFieldValue,
      if (cardAmount != _sentinel)
        _$$_GameFieldMap['cardAmount']!: cardAmount as int,
      if (cardAmountFieldValue != null)
        _$$_GameFieldMap['cardAmount']!: cardAmountFieldValue,
      if (playerIds != _sentinel)
        _$$_GameFieldMap['playerIds']!: playerIds as List<String>,
      if (playerIdsFieldValue != null)
        _$$_GameFieldMap['playerIds']!: playerIdsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? gameId = _sentinel,
    FieldValue? gameIdFieldValue,
    Object? createdTime = _sentinel,
    FieldValue? createdTimeFieldValue,
    Object? joinCode = _sentinel,
    FieldValue? joinCodeFieldValue,
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? cardPack = _sentinel,
    FieldValue? cardPackFieldValue,
    Object? cardAmount = _sentinel,
    FieldValue? cardAmountFieldValue,
    Object? playerIds = _sentinel,
    FieldValue? playerIdsFieldValue,
  }) {
    assert(
      gameId == _sentinel || gameIdFieldValue == null,
      "Cannot specify both gameId and gameIdFieldValue",
    );
    assert(
      createdTime == _sentinel || createdTimeFieldValue == null,
      "Cannot specify both createdTime and createdTimeFieldValue",
    );
    assert(
      joinCode == _sentinel || joinCodeFieldValue == null,
      "Cannot specify both joinCode and joinCodeFieldValue",
    );
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      cardPack == _sentinel || cardPackFieldValue == null,
      "Cannot specify both cardPack and cardPackFieldValue",
    );
    assert(
      cardAmount == _sentinel || cardAmountFieldValue == null,
      "Cannot specify both cardAmount and cardAmountFieldValue",
    );
    assert(
      playerIds == _sentinel || playerIdsFieldValue == null,
      "Cannot specify both playerIds and playerIdsFieldValue",
    );
    final json = {
      if (gameId != _sentinel) _$$_GameFieldMap['gameId']!: gameId as String,
      if (gameIdFieldValue != null)
        _$$_GameFieldMap['gameId']!: gameIdFieldValue,
      if (createdTime != _sentinel)
        _$$_GameFieldMap['createdTime']!: createdTime as DateTime,
      if (createdTimeFieldValue != null)
        _$$_GameFieldMap['createdTime']!: createdTimeFieldValue,
      if (joinCode != _sentinel)
        _$$_GameFieldMap['joinCode']!: joinCode as String,
      if (joinCodeFieldValue != null)
        _$$_GameFieldMap['joinCode']!: joinCodeFieldValue,
      if (displayName != _sentinel)
        _$$_GameFieldMap['displayName']!: displayName as String,
      if (displayNameFieldValue != null)
        _$$_GameFieldMap['displayName']!: displayNameFieldValue,
      if (cardPack != _sentinel)
        _$$_GameFieldMap['cardPack']!: cardPack as String,
      if (cardPackFieldValue != null)
        _$$_GameFieldMap['cardPack']!: cardPackFieldValue,
      if (cardAmount != _sentinel)
        _$$_GameFieldMap['cardAmount']!: cardAmount as int,
      if (cardAmountFieldValue != null)
        _$$_GameFieldMap['cardAmount']!: cardAmountFieldValue,
      if (playerIds != _sentinel)
        _$$_GameFieldMap['playerIds']!: playerIds as List<String>,
      if (playerIdsFieldValue != null)
        _$$_GameFieldMap['playerIds']!: playerIdsFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class GameQuery implements QueryReference<Game, GameQuerySnapshot> {
  @override
  GameQuery limit(int limit);

  @override
  GameQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  GameQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  GameQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  GameQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereGameId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereCreatedTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  GameQuery whereJoinCode({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereDisplayName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereCardPack({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  GameQuery whereCardAmount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  GameQuery wherePlayerIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });

  GameQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByGameId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByCreatedTime({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByJoinCode({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByDisplayName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByCardPack({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByCardAmount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });

  GameQuery orderByPlayerIds({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  });
}

class _$GameQuery extends QueryReference<Game, GameQuerySnapshot>
    implements GameQuery {
  _$GameQuery(
    this._collection, {
    required Query<Game> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GameQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GameQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GameQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GameQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GameQuery limit(int limit) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GameQuery limitToLast(int limit) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereGameId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['gameId']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereCreatedTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['createdTime']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereJoinCode({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['joinCode']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereDisplayName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['displayName']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereCardPack({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['cardPack']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery whereCardAmount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['cardAmount']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery wherePlayerIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_GameFieldMap['playerIds']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      $queryCursor: $queryCursor,
    );
  }

  GameQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByGameId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GameFieldMap['gameId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByCreatedTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_GameFieldMap['createdTime']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByJoinCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GameFieldMap['joinCode']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_GameFieldMap['displayName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByCardPack({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_GameFieldMap['cardPack']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByCardAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_GameFieldMap['cardAmount']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GameQuery orderByPlayerIds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameDocumentSnapshot? startAtDocument,
    GameDocumentSnapshot? endAtDocument,
    GameDocumentSnapshot? endBeforeDocument,
    GameDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_GameFieldMap['playerIds']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$GameQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GameDocumentSnapshot extends FirestoreDocumentSnapshot<Game> {
  GameDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Game> snapshot;

  @override
  GameDocumentReference get reference {
    return GameDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Game? data;
}

class GameQuerySnapshot
    extends FirestoreQuerySnapshot<Game, GameQueryDocumentSnapshot> {
  GameQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GameQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Game> snapshot,
  ) {
    final docs = snapshot.docs.map(GameQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GameDocumentSnapshot._,
      );
    }).toList();

    return GameQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GameDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GameDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GameDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Game> snapshot;

  @override
  final List<GameQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GameDocumentSnapshot>> docChanges;
}

class GameQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Game>
    implements GameDocumentSnapshot {
  GameQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Game> snapshot;

  @override
  final Game data;

  @override
  GameDocumentReference get reference {
    return GameDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      gameId: json['gameId'] as String,
      createdTime: const FirestoreDateTimeConverter()
          .fromJson(json['createdTime'] as Timestamp),
      gameStatus: $enumDecode(_$GameStatusEnumMap, json['gameStatus']),
      joinCode: json['joinCode'] as String,
      displayName: json['displayName'] as String,
      cardPack: json['cardPack'] as String,
      cardAmount: json['cardAmount'] as int,
      host: Map<String, String>.from(json['host'] as Map),
      currentTurn: Map<String, String>.from(json['currentTurn'] as Map),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      playerIds:
          (json['playerIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

const _$$_GameFieldMap = <String, String>{
  'gameId': 'gameId',
  'createdTime': 'createdTime',
  'gameStatus': 'gameStatus',
  'joinCode': 'joinCode',
  'displayName': 'displayName',
  'cardPack': 'cardPack',
  'cardAmount': 'cardAmount',
  'host': 'host',
  'currentTurn': 'currentTurn',
  'players': 'players',
  'playerIds': 'playerIds',
};

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'gameId': instance.gameId,
      'createdTime':
          const FirestoreDateTimeConverter().toJson(instance.createdTime),
      'gameStatus': _$GameStatusEnumMap[instance.gameStatus]!,
      'joinCode': instance.joinCode,
      'displayName': instance.displayName,
      'cardPack': instance.cardPack,
      'cardAmount': instance.cardAmount,
      'host': instance.host,
      'currentTurn': instance.currentTurn,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'playerIds': instance.playerIds,
    };

const _$GameStatusEnumMap = {
  GameStatus.isInPreLobby: 'isInPreLobby',
  GameStatus.isInProgress: 'isInProgress',
  GameStatus.isOver: 'isOver',
};
