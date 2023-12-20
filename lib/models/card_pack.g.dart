// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_pack.dart';

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
abstract class CardPackCollectionReference
    implements
        CardPackQuery,
        FirestoreCollectionReference<CardPack, CardPackQuerySnapshot> {
  factory CardPackCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CardPackCollectionReference;

  static CardPack fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CardPack.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CardPack value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<CardPack> get reference;

  @override
  CardPackDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CardPackDocumentReference> add(CardPack value);
}

class _$CardPackCollectionReference extends _$CardPackQuery
    implements CardPackCollectionReference {
  factory _$CardPackCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CardPackCollectionReference._(
      firestore.collection('card_packs').withConverter(
            fromFirestore: CardPackCollectionReference.fromFirestore,
            toFirestore: CardPackCollectionReference.toFirestore,
          ),
    );
  }

  _$CardPackCollectionReference._(
    CollectionReference<CardPack> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CardPack> get reference =>
      super.reference as CollectionReference<CardPack>;

  @override
  CardPackDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CardPackDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CardPackDocumentReference> add(CardPack value) {
    return reference.add(value).then((ref) => CardPackDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CardPackCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CardPackDocumentReference
    extends FirestoreDocumentReference<CardPack, CardPackDocumentSnapshot> {
  factory CardPackDocumentReference(DocumentReference<CardPack> reference) =
      _$CardPackDocumentReference;

  DocumentReference<CardPack> get reference;

  /// A reference to the [CardPackCollectionReference] containing this document.
  CardPackCollectionReference get parent {
    return _$CardPackCollectionReference(reference.firestore);
  }

  @override
  Stream<CardPackDocumentSnapshot> snapshots();

  @override
  Future<CardPackDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String displayName,
    FieldValue displayNameFieldValue,
    String description,
    FieldValue descriptionFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String displayName,
    FieldValue displayNameFieldValue,
    String description,
    FieldValue descriptionFieldValue,
  });
}

class _$CardPackDocumentReference
    extends FirestoreDocumentReference<CardPack, CardPackDocumentSnapshot>
    implements CardPackDocumentReference {
  _$CardPackDocumentReference(this.reference);

  @override
  final DocumentReference<CardPack> reference;

  /// A reference to the [CardPackCollectionReference] containing this document.
  CardPackCollectionReference get parent {
    return _$CardPackCollectionReference(reference.firestore);
  }

  @override
  Stream<CardPackDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CardPackDocumentSnapshot._);
  }

  @override
  Future<CardPackDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CardPackDocumentSnapshot._);
  }

  @override
  Future<CardPackDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CardPackDocumentSnapshot._);
  }

  Future<void> update({
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
  }) async {
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    final json = {
      if (displayName != _sentinel)
        _$$_CardPackFieldMap['displayName']!: displayName as String,
      if (displayNameFieldValue != null)
        _$$_CardPackFieldMap['displayName']!: displayNameFieldValue,
      if (description != _sentinel)
        _$$_CardPackFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_CardPackFieldMap['description']!: descriptionFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
  }) {
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    final json = {
      if (displayName != _sentinel)
        _$$_CardPackFieldMap['displayName']!: displayName as String,
      if (displayNameFieldValue != null)
        _$$_CardPackFieldMap['displayName']!: displayNameFieldValue,
      if (description != _sentinel)
        _$$_CardPackFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_CardPackFieldMap['description']!: descriptionFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CardPackDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CardPackQuery
    implements QueryReference<CardPack, CardPackQuerySnapshot> {
  @override
  CardPackQuery limit(int limit);

  @override
  CardPackQuery limitToLast(int limit);

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
  CardPackQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
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
  CardPackQuery whereFieldPath(
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

  CardPackQuery whereDocumentId({
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
  CardPackQuery whereDisplayName({
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
  CardPackQuery whereDescription({
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

  CardPackQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
  });

  CardPackQuery orderByDisplayName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
  });

  CardPackQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
  });
}

class _$CardPackQuery extends QueryReference<CardPack, CardPackQuerySnapshot>
    implements CardPackQuery {
  _$CardPackQuery(
    this._collection, {
    required Query<CardPack> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CardPackQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(CardPackQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CardPackQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CardPackQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CardPackQuery limit(int limit) {
    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CardPackQuery limitToLast(int limit) {
    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  CardPackQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
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
    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CardPackQuery whereFieldPath(
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
    return _$CardPackQuery(
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

  CardPackQuery whereDocumentId({
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
    return _$CardPackQuery(
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

  CardPackQuery whereDisplayName({
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
    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_CardPackFieldMap['displayName']!,
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

  CardPackQuery whereDescription({
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
    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_CardPackFieldMap['description']!,
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

  CardPackQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
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

    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CardPackQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_CardPackFieldMap['displayName']!, descending: descending);
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

    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  CardPackQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CardPackDocumentSnapshot? startAtDocument,
    CardPackDocumentSnapshot? endAtDocument,
    CardPackDocumentSnapshot? endBeforeDocument,
    CardPackDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_CardPackFieldMap['description']!, descending: descending);
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

    return _$CardPackQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CardPackQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CardPackDocumentSnapshot extends FirestoreDocumentSnapshot<CardPack> {
  CardPackDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CardPack> snapshot;

  @override
  CardPackDocumentReference get reference {
    return CardPackDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CardPack? data;
}

class CardPackQuerySnapshot
    extends FirestoreQuerySnapshot<CardPack, CardPackQueryDocumentSnapshot> {
  CardPackQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CardPackQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CardPack> snapshot,
  ) {
    final docs = snapshot.docs.map(CardPackQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CardPackDocumentSnapshot._,
      );
    }).toList();

    return CardPackQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CardPackDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CardPackDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CardPackDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CardPack> snapshot;

  @override
  final List<CardPackQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CardPackDocumentSnapshot>> docChanges;
}

class CardPackQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CardPack>
    implements CardPackDocumentSnapshot {
  CardPackQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CardPack> snapshot;

  @override
  final CardPack data;

  @override
  CardPackDocumentReference get reference {
    return CardPackDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardPack _$$_CardPackFromJson(Map<String, dynamic> json) => _$_CardPack(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      cards: (json['cards'] as List<dynamic>)
          .map((e) => GameCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$_CardPackFieldMap = <String, String>{
  'id': 'id',
  'displayName': 'displayName',
  'description': 'description',
  'cards': 'cards',
};

Map<String, dynamic> _$$_CardPackToJson(_$_CardPack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'description': instance.description,
      'cards': instance.cards.map((e) => e.toJson()).toList(),
    };
