// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
abstract class WhatCardUserCollectionReference
    implements
        WhatCardUserQuery,
        FirestoreCollectionReference<WhatCardUser, WhatCardUserQuerySnapshot> {
  factory WhatCardUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$WhatCardUserCollectionReference;

  static WhatCardUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return WhatCardUser.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    WhatCardUser value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<WhatCardUser> get reference;

  @override
  WhatCardUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<WhatCardUserDocumentReference> add(WhatCardUser value);
}

class _$WhatCardUserCollectionReference extends _$WhatCardUserQuery
    implements WhatCardUserCollectionReference {
  factory _$WhatCardUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$WhatCardUserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: WhatCardUserCollectionReference.fromFirestore,
            toFirestore: WhatCardUserCollectionReference.toFirestore,
          ),
    );
  }

  _$WhatCardUserCollectionReference._(
    CollectionReference<WhatCardUser> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<WhatCardUser> get reference =>
      super.reference as CollectionReference<WhatCardUser>;

  @override
  WhatCardUserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return WhatCardUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<WhatCardUserDocumentReference> add(WhatCardUser value) {
    return reference
        .add(value)
        .then((ref) => WhatCardUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$WhatCardUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class WhatCardUserDocumentReference extends FirestoreDocumentReference<
    WhatCardUser, WhatCardUserDocumentSnapshot> {
  factory WhatCardUserDocumentReference(
          DocumentReference<WhatCardUser> reference) =
      _$WhatCardUserDocumentReference;

  DocumentReference<WhatCardUser> get reference;

  /// A reference to the [WhatCardUserCollectionReference] containing this document.
  WhatCardUserCollectionReference get parent {
    return _$WhatCardUserCollectionReference(reference.firestore);
  }

  @override
  Stream<WhatCardUserDocumentSnapshot> snapshots();

  @override
  Future<WhatCardUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String phoneNumber,
    FieldValue phoneNumberFieldValue,
    DateTime createdTime,
    FieldValue createdTimeFieldValue,
    String? fcmToken,
    FieldValue fcmTokenFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String phoneNumber,
    FieldValue phoneNumberFieldValue,
    DateTime createdTime,
    FieldValue createdTimeFieldValue,
    String? fcmToken,
    FieldValue fcmTokenFieldValue,
  });
}

class _$WhatCardUserDocumentReference extends FirestoreDocumentReference<
    WhatCardUser,
    WhatCardUserDocumentSnapshot> implements WhatCardUserDocumentReference {
  _$WhatCardUserDocumentReference(this.reference);

  @override
  final DocumentReference<WhatCardUser> reference;

  /// A reference to the [WhatCardUserCollectionReference] containing this document.
  WhatCardUserCollectionReference get parent {
    return _$WhatCardUserCollectionReference(reference.firestore);
  }

  @override
  Stream<WhatCardUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(WhatCardUserDocumentSnapshot._);
  }

  @override
  Future<WhatCardUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(WhatCardUserDocumentSnapshot._);
  }

  @override
  Future<WhatCardUserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(WhatCardUserDocumentSnapshot._);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
    Object? createdTime = _sentinel,
    FieldValue? createdTimeFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    assert(
      createdTime == _sentinel || createdTimeFieldValue == null,
      "Cannot specify both createdTime and createdTimeFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_WhatCardUserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null)
        _$$_WhatCardUserFieldMap['uid']!: uidFieldValue,
      if (phoneNumber != _sentinel)
        _$$_WhatCardUserFieldMap['phoneNumber']!: phoneNumber as String,
      if (phoneNumberFieldValue != null)
        _$$_WhatCardUserFieldMap['phoneNumber']!: phoneNumberFieldValue,
      if (createdTime != _sentinel)
        _$$_WhatCardUserFieldMap['createdTime']!: createdTime as DateTime,
      if (createdTimeFieldValue != null)
        _$$_WhatCardUserFieldMap['createdTime']!: createdTimeFieldValue,
      if (fcmToken != _sentinel)
        _$$_WhatCardUserFieldMap['fcmToken']!: fcmToken as String?,
      if (fcmTokenFieldValue != null)
        _$$_WhatCardUserFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
    Object? createdTime = _sentinel,
    FieldValue? createdTimeFieldValue,
    Object? fcmToken = _sentinel,
    FieldValue? fcmTokenFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    assert(
      createdTime == _sentinel || createdTimeFieldValue == null,
      "Cannot specify both createdTime and createdTimeFieldValue",
    );
    assert(
      fcmToken == _sentinel || fcmTokenFieldValue == null,
      "Cannot specify both fcmToken and fcmTokenFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_WhatCardUserFieldMap['uid']!: uid as String,
      if (uidFieldValue != null)
        _$$_WhatCardUserFieldMap['uid']!: uidFieldValue,
      if (phoneNumber != _sentinel)
        _$$_WhatCardUserFieldMap['phoneNumber']!: phoneNumber as String,
      if (phoneNumberFieldValue != null)
        _$$_WhatCardUserFieldMap['phoneNumber']!: phoneNumberFieldValue,
      if (createdTime != _sentinel)
        _$$_WhatCardUserFieldMap['createdTime']!: createdTime as DateTime,
      if (createdTimeFieldValue != null)
        _$$_WhatCardUserFieldMap['createdTime']!: createdTimeFieldValue,
      if (fcmToken != _sentinel)
        _$$_WhatCardUserFieldMap['fcmToken']!: fcmToken as String?,
      if (fcmTokenFieldValue != null)
        _$$_WhatCardUserFieldMap['fcmToken']!: fcmTokenFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is WhatCardUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class WhatCardUserQuery
    implements QueryReference<WhatCardUser, WhatCardUserQuerySnapshot> {
  @override
  WhatCardUserQuery limit(int limit);

  @override
  WhatCardUserQuery limitToLast(int limit);

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
  WhatCardUserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
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
  WhatCardUserQuery whereFieldPath(
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

  WhatCardUserQuery whereDocumentId({
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
  WhatCardUserQuery whereUid({
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
  WhatCardUserQuery wherePhoneNumber({
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
  WhatCardUserQuery whereCreatedTime({
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
  WhatCardUserQuery whereFcmToken({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  WhatCardUserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  });

  WhatCardUserQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  });

  WhatCardUserQuery orderByPhoneNumber({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  });

  WhatCardUserQuery orderByCreatedTime({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  });

  WhatCardUserQuery orderByFcmToken({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  });
}

class _$WhatCardUserQuery
    extends QueryReference<WhatCardUser, WhatCardUserQuerySnapshot>
    implements WhatCardUserQuery {
  _$WhatCardUserQuery(
    this._collection, {
    required Query<WhatCardUser> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<WhatCardUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(WhatCardUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<WhatCardUserQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(WhatCardUserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  WhatCardUserQuery limit(int limit) {
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  WhatCardUserQuery limitToLast(int limit) {
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  WhatCardUserQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
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
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  WhatCardUserQuery whereFieldPath(
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
    return _$WhatCardUserQuery(
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

  WhatCardUserQuery whereDocumentId({
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
    return _$WhatCardUserQuery(
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

  WhatCardUserQuery whereUid({
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
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_WhatCardUserFieldMap['uid']!,
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

  WhatCardUserQuery wherePhoneNumber({
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
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_WhatCardUserFieldMap['phoneNumber']!,
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

  WhatCardUserQuery whereCreatedTime({
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
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_WhatCardUserFieldMap['createdTime']!,
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

  WhatCardUserQuery whereFcmToken({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_WhatCardUserFieldMap['fcmToken']!,
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

  WhatCardUserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
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

    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  WhatCardUserQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_WhatCardUserFieldMap['uid']!, descending: descending);
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

    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  WhatCardUserQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$_WhatCardUserFieldMap['phoneNumber']!,
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

    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  WhatCardUserQuery orderByCreatedTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$$_WhatCardUserFieldMap['createdTime']!,
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

    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  WhatCardUserQuery orderByFcmToken({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WhatCardUserDocumentSnapshot? startAtDocument,
    WhatCardUserDocumentSnapshot? endAtDocument,
    WhatCardUserDocumentSnapshot? endBeforeDocument,
    WhatCardUserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_WhatCardUserFieldMap['fcmToken']!, descending: descending);
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

    return _$WhatCardUserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$WhatCardUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class WhatCardUserDocumentSnapshot
    extends FirestoreDocumentSnapshot<WhatCardUser> {
  WhatCardUserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<WhatCardUser> snapshot;

  @override
  WhatCardUserDocumentReference get reference {
    return WhatCardUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final WhatCardUser? data;
}

class WhatCardUserQuerySnapshot extends FirestoreQuerySnapshot<WhatCardUser,
    WhatCardUserQueryDocumentSnapshot> {
  WhatCardUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory WhatCardUserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<WhatCardUser> snapshot,
  ) {
    final docs =
        snapshot.docs.map(WhatCardUserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        WhatCardUserDocumentSnapshot._,
      );
    }).toList();

    return WhatCardUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<WhatCardUserDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    WhatCardUserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<WhatCardUserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<WhatCardUser> snapshot;

  @override
  final List<WhatCardUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<WhatCardUserDocumentSnapshot>> docChanges;
}

class WhatCardUserQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<WhatCardUser>
    implements WhatCardUserDocumentSnapshot {
  WhatCardUserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<WhatCardUser> snapshot;

  @override
  final WhatCardUser data;

  @override
  WhatCardUserDocumentReference get reference {
    return WhatCardUserDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WhatCardUser _$$_WhatCardUserFromJson(Map<String, dynamic> json) =>
    _$_WhatCardUser(
      uid: json['uid'] as String,
      phoneNumber: json['phoneNumber'] as String,
      createdTime: const FirestoreDateTimeConverter()
          .fromJson(json['createdTime'] as Timestamp),
      fcmToken: json['fcmToken'] as String?,
    );

const _$$_WhatCardUserFieldMap = <String, String>{
  'uid': 'uid',
  'phoneNumber': 'phoneNumber',
  'createdTime': 'createdTime',
  'fcmToken': 'fcmToken',
};

Map<String, dynamic> _$$_WhatCardUserToJson(_$_WhatCardUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'createdTime':
          const FirestoreDateTimeConverter().toJson(instance.createdTime),
      'fcmToken': instance.fcmToken,
    };
