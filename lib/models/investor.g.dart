// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class InvestorCollectionReference
    implements
        InvestorQuery,
        FirestoreCollectionReference<InvestorQuerySnapshot> {
  factory InvestorCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$InvestorCollectionReference;

  static Investor fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Investor.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Investor value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  InvestorDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<InvestorDocumentReference> add(Investor value);
}

class _$InvestorCollectionReference extends _$InvestorQuery
    implements InvestorCollectionReference {
  factory _$InvestorCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$InvestorCollectionReference._(
      firestore.collection('investors').withConverter(
            fromFirestore: InvestorCollectionReference.fromFirestore,
            toFirestore: InvestorCollectionReference.toFirestore,
          ),
    );
  }

  _$InvestorCollectionReference._(
    CollectionReference<Investor> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Investor> get reference =>
      super.reference as CollectionReference<Investor>;

  @override
  InvestorDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return InvestorDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<InvestorDocumentReference> add(Investor value) {
    return reference.add(value).then((ref) => InvestorDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$InvestorCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class InvestorDocumentReference
    extends FirestoreDocumentReference<InvestorDocumentSnapshot> {
  factory InvestorDocumentReference(DocumentReference<Investor> reference) =
      _$InvestorDocumentReference;

  DocumentReference<Investor> get reference;

  /// A reference to the [InvestorCollectionReference] containing this document.
  InvestorCollectionReference get parent {
    return _$InvestorCollectionReference(reference.firestore);
  }

  late final DataCollectionReference holdings = _$DataCollectionReference(
    reference,
  );

  late final PortfolioCollectionReference portfolios =
      _$PortfolioCollectionReference(
    reference,
  );

  @override
  Stream<InvestorDocumentSnapshot> snapshots();

  @override
  Future<InvestorDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? dob,
    String? lockPin,
    bool? isFingerprintAuthenticated,
    bool? isDarkTheme,
  });

  Future<void> set(Investor value);
}

class _$InvestorDocumentReference
    extends FirestoreDocumentReference<InvestorDocumentSnapshot>
    implements InvestorDocumentReference {
  _$InvestorDocumentReference(this.reference);

  @override
  final DocumentReference<Investor> reference;

  /// A reference to the [InvestorCollectionReference] containing this document.
  InvestorCollectionReference get parent {
    return _$InvestorCollectionReference(reference.firestore);
  }

  late final DataCollectionReference holdings = _$DataCollectionReference(
    reference,
  );

  late final PortfolioCollectionReference portfolios =
      _$PortfolioCollectionReference(
    reference,
  );

  @override
  Stream<InvestorDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return InvestorDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<InvestorDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return InvestorDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? uid = _sentinel,
    Object? name = _sentinel,
    Object? email = _sentinel,
    Object? phone = _sentinel,
    Object? dob = _sentinel,
    Object? lockPin = _sentinel,
    Object? isFingerprintAuthenticated = _sentinel,
    Object? isDarkTheme = _sentinel,
  }) async {
    final json = {
      if (uid != _sentinel) "uid": uid as String?,
      if (name != _sentinel) "name": name as String?,
      if (email != _sentinel) "email": email as String?,
      if (phone != _sentinel) "phone": phone as String?,
      if (dob != _sentinel) "dob": dob as String?,
      if (lockPin != _sentinel) "lockPin": lockPin as String?,
      if (isFingerprintAuthenticated != _sentinel)
        "isFingerprintAuthenticated": isFingerprintAuthenticated as bool?,
      if (isDarkTheme != _sentinel) "isDarkTheme": isDarkTheme as bool?,
    };

    return reference.update(json);
  }

  Future<void> set(Investor value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is InvestorDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class InvestorDocumentSnapshot extends FirestoreDocumentSnapshot {
  InvestorDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Investor> snapshot;

  @override
  InvestorDocumentReference get reference {
    return InvestorDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Investor? data;
}

abstract class InvestorQuery implements QueryReference<InvestorQuerySnapshot> {
  @override
  InvestorQuery limit(int limit);

  @override
  InvestorQuery limitToLast(int limit);

  InvestorQuery whereUid({
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
  InvestorQuery whereName({
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
  InvestorQuery whereEmail({
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
  InvestorQuery wherePhone({
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
  InvestorQuery whereDob({
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
  InvestorQuery whereLockPin({
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
  InvestorQuery whereIsFingerprintAuthenticated({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  InvestorQuery whereIsDarkTheme({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });

  InvestorQuery orderByUid({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByPhone({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByDob({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByLockPin({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByIsFingerprintAuthenticated({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });

  InvestorQuery orderByIsDarkTheme({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  });
}

class _$InvestorQuery extends QueryReference<InvestorQuerySnapshot>
    implements InvestorQuery {
  _$InvestorQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Investor> reference;

  InvestorQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Investor> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return InvestorQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<InvestorDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: InvestorDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return InvestorQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<InvestorQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<InvestorQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  InvestorQuery limit(int limit) {
    return _$InvestorQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  InvestorQuery limitToLast(int limit) {
    return _$InvestorQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  InvestorQuery whereUid({
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
    return _$InvestorQuery(
      reference.where(
        'uid',
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
      _collection,
    );
  }

  InvestorQuery whereName({
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
    return _$InvestorQuery(
      reference.where(
        'name',
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
      _collection,
    );
  }

  InvestorQuery whereEmail({
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
    return _$InvestorQuery(
      reference.where(
        'email',
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
      _collection,
    );
  }

  InvestorQuery wherePhone({
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
    return _$InvestorQuery(
      reference.where(
        'phone',
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
      _collection,
    );
  }

  InvestorQuery whereDob({
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
    return _$InvestorQuery(
      reference.where(
        'dob',
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
      _collection,
    );
  }

  InvestorQuery whereLockPin({
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
    return _$InvestorQuery(
      reference.where(
        'lockPin',
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
      _collection,
    );
  }

  InvestorQuery whereIsFingerprintAuthenticated({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$InvestorQuery(
      reference.where(
        'isFingerprintAuthenticated',
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
      _collection,
    );
  }

  InvestorQuery whereIsDarkTheme({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$InvestorQuery(
      reference.where(
        'isDarkTheme',
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
      _collection,
    );
  }

  InvestorQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('uid', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('email', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByPhone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phone', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByDob({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('dob', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByLockPin({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lockPin', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByIsFingerprintAuthenticated({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('isFingerprintAuthenticated', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  InvestorQuery orderByIsDarkTheme({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvestorDocumentSnapshot? startAtDocument,
    InvestorDocumentSnapshot? endAtDocument,
    InvestorDocumentSnapshot? endBeforeDocument,
    InvestorDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDarkTheme', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$InvestorQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$InvestorQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class InvestorQuerySnapshot
    extends FirestoreQuerySnapshot<InvestorQueryDocumentSnapshot> {
  InvestorQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Investor> snapshot;

  @override
  final List<InvestorQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<InvestorDocumentSnapshot>> docChanges;
}

class InvestorQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements InvestorDocumentSnapshot {
  InvestorQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Investor> snapshot;

  @override
  InvestorDocumentReference get reference {
    return InvestorDocumentReference(snapshot.reference);
  }

  @override
  final Investor data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class DataCollectionReference
    implements DataQuery, FirestoreCollectionReference<DataQuerySnapshot> {
  factory DataCollectionReference(
    DocumentReference<Investor> parent,
  ) = _$DataCollectionReference;

  static Data fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Data.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Data value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [InvestorDocumentReference] if this is a subcollection.
  InvestorDocumentReference get parent;

  @override
  DataDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DataDocumentReference> add(Data value);
}

class _$DataCollectionReference extends _$DataQuery
    implements DataCollectionReference {
  factory _$DataCollectionReference(
    DocumentReference<Investor> parent,
  ) {
    return _$DataCollectionReference._(
      InvestorDocumentReference(parent),
      parent.collection('holdings').withConverter(
            fromFirestore: DataCollectionReference.fromFirestore,
            toFirestore: DataCollectionReference.toFirestore,
          ),
    );
  }

  _$DataCollectionReference._(
    this.parent,
    CollectionReference<Data> reference,
  ) : super(reference, reference);

  @override
  final InvestorDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Data> get reference =>
      super.reference as CollectionReference<Data>;

  @override
  DataDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return DataDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<DataDocumentReference> add(Data value) {
    return reference.add(value).then((ref) => DataDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$DataCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class DataDocumentReference
    extends FirestoreDocumentReference<DataDocumentSnapshot> {
  factory DataDocumentReference(DocumentReference<Data> reference) =
      _$DataDocumentReference;

  DocumentReference<Data> get reference;

  /// A reference to the [DataCollectionReference] containing this document.
  DataCollectionReference get parent {
    return _$DataCollectionReference(
      reference.parent.parent!.withConverter<Investor>(
        fromFirestore: InvestorCollectionReference.fromFirestore,
        toFirestore: InvestorCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<DataDocumentSnapshot> snapshots();

  @override
  Future<DataDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    bool updating,
    String smallcaseAuthId,
    String broker,
  });

  Future<void> set(Data value);
}

class _$DataDocumentReference
    extends FirestoreDocumentReference<DataDocumentSnapshot>
    implements DataDocumentReference {
  _$DataDocumentReference(this.reference);

  @override
  final DocumentReference<Data> reference;

  /// A reference to the [DataCollectionReference] containing this document.
  DataCollectionReference get parent {
    return _$DataCollectionReference(
      reference.parent.parent!.withConverter<Investor>(
        fromFirestore: InvestorCollectionReference.fromFirestore,
        toFirestore: InvestorCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<DataDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return DataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<DataDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return DataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? updating = _sentinel,
    Object? smallcaseAuthId = _sentinel,
    Object? broker = _sentinel,
  }) async {
    final json = {
      if (updating != _sentinel) "updating": updating as bool,
      if (smallcaseAuthId != _sentinel)
        "smallcaseAuthId": smallcaseAuthId as String,
      if (broker != _sentinel) "broker": broker as String,
    };

    return reference.update(json);
  }

  Future<void> set(Data value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is DataDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class DataDocumentSnapshot extends FirestoreDocumentSnapshot {
  DataDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Data> snapshot;

  @override
  DataDocumentReference get reference {
    return DataDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Data? data;
}

abstract class DataQuery implements QueryReference<DataQuerySnapshot> {
  @override
  DataQuery limit(int limit);

  @override
  DataQuery limitToLast(int limit);

  DataQuery whereUpdating({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  DataQuery whereSmallcaseAuthId({
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
  DataQuery whereBroker({
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

  DataQuery orderByUpdating({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  });

  DataQuery orderBySmallcaseAuthId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  });

  DataQuery orderByBroker({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  });
}

class _$DataQuery extends QueryReference<DataQuerySnapshot>
    implements DataQuery {
  _$DataQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Data> reference;

  DataQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Data> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return DataQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<DataDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: DataDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return DataQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<DataQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<DataQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  DataQuery limit(int limit) {
    return _$DataQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  DataQuery limitToLast(int limit) {
    return _$DataQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  DataQuery whereUpdating({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$DataQuery(
      reference.where(
        'updating',
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
      _collection,
    );
  }

  DataQuery whereSmallcaseAuthId({
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
    return _$DataQuery(
      reference.where(
        'smallcaseAuthId',
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
      _collection,
    );
  }

  DataQuery whereBroker({
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
    return _$DataQuery(
      reference.where(
        'broker',
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
      _collection,
    );
  }

  DataQuery orderByUpdating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('updating', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DataQuery(query, _collection);
  }

  DataQuery orderBySmallcaseAuthId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('smallcaseAuthId', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DataQuery(query, _collection);
  }

  DataQuery orderByBroker({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DataDocumentSnapshot? startAtDocument,
    DataDocumentSnapshot? endAtDocument,
    DataDocumentSnapshot? endBeforeDocument,
    DataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('broker', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DataQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$DataQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class DataQuerySnapshot
    extends FirestoreQuerySnapshot<DataQueryDocumentSnapshot> {
  DataQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Data> snapshot;

  @override
  final List<DataQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<DataDocumentSnapshot>> docChanges;
}

class DataQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements DataDocumentSnapshot {
  DataQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Data> snapshot;

  @override
  DataDocumentReference get reference {
    return DataDocumentReference(snapshot.reference);
  }

  @override
  final Data data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PortfolioCollectionReference
    implements
        PortfolioQuery,
        FirestoreCollectionReference<PortfolioQuerySnapshot> {
  factory PortfolioCollectionReference(
    DocumentReference<Investor> parent,
  ) = _$PortfolioCollectionReference;

  static Portfolio fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Portfolio.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Portfolio value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [InvestorDocumentReference] if this is a subcollection.
  InvestorDocumentReference get parent;

  @override
  PortfolioDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PortfolioDocumentReference> add(Portfolio value);
}

class _$PortfolioCollectionReference extends _$PortfolioQuery
    implements PortfolioCollectionReference {
  factory _$PortfolioCollectionReference(
    DocumentReference<Investor> parent,
  ) {
    return _$PortfolioCollectionReference._(
      InvestorDocumentReference(parent),
      parent.collection('portfolios').withConverter(
            fromFirestore: PortfolioCollectionReference.fromFirestore,
            toFirestore: PortfolioCollectionReference.toFirestore,
          ),
    );
  }

  _$PortfolioCollectionReference._(
    this.parent,
    CollectionReference<Portfolio> reference,
  ) : super(reference, reference);

  @override
  final InvestorDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Portfolio> get reference =>
      super.reference as CollectionReference<Portfolio>;

  @override
  PortfolioDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return PortfolioDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PortfolioDocumentReference> add(Portfolio value) {
    return reference.add(value).then((ref) => PortfolioDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PortfolioCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PortfolioDocumentReference
    extends FirestoreDocumentReference<PortfolioDocumentSnapshot> {
  factory PortfolioDocumentReference(DocumentReference<Portfolio> reference) =
      _$PortfolioDocumentReference;

  DocumentReference<Portfolio> get reference;

  /// A reference to the [PortfolioCollectionReference] containing this document.
  PortfolioCollectionReference get parent {
    return _$PortfolioCollectionReference(
      reference.parent.parent!.withConverter<Investor>(
        fromFirestore: InvestorCollectionReference.fromFirestore,
        toFirestore: InvestorCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PortfolioDocumentSnapshot> snapshots();

  @override
  Future<PortfolioDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(Portfolio value);
}

class _$PortfolioDocumentReference
    extends FirestoreDocumentReference<PortfolioDocumentSnapshot>
    implements PortfolioDocumentReference {
  _$PortfolioDocumentReference(this.reference);

  @override
  final DocumentReference<Portfolio> reference;

  /// A reference to the [PortfolioCollectionReference] containing this document.
  PortfolioCollectionReference get parent {
    return _$PortfolioCollectionReference(
      reference.parent.parent!.withConverter<Investor>(
        fromFirestore: InvestorCollectionReference.fromFirestore,
        toFirestore: InvestorCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<PortfolioDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return PortfolioDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<PortfolioDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return PortfolioDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(Portfolio value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is PortfolioDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class PortfolioDocumentSnapshot extends FirestoreDocumentSnapshot {
  PortfolioDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Portfolio> snapshot;

  @override
  PortfolioDocumentReference get reference {
    return PortfolioDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Portfolio? data;
}

abstract class PortfolioQuery
    implements QueryReference<PortfolioQuerySnapshot> {
  @override
  PortfolioQuery limit(int limit);

  @override
  PortfolioQuery limitToLast(int limit);
}

class _$PortfolioQuery extends QueryReference<PortfolioQuerySnapshot>
    implements PortfolioQuery {
  _$PortfolioQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Portfolio> reference;

  PortfolioQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Portfolio> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return PortfolioQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<PortfolioDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: PortfolioDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return PortfolioQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<PortfolioQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<PortfolioQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  PortfolioQuery limit(int limit) {
    return _$PortfolioQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  PortfolioQuery limitToLast(int limit) {
    return _$PortfolioQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$PortfolioQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PortfolioQuerySnapshot
    extends FirestoreQuerySnapshot<PortfolioQueryDocumentSnapshot> {
  PortfolioQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Portfolio> snapshot;

  @override
  final List<PortfolioQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PortfolioDocumentSnapshot>> docChanges;
}

class PortfolioQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements PortfolioDocumentSnapshot {
  PortfolioQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Portfolio> snapshot;

  @override
  PortfolioDocumentReference get reference {
    return PortfolioDocumentReference(snapshot.reference);
  }

  @override
  final Portfolio data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investor _$InvestorFromJson(Map<String, dynamic> json) => Investor(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      uid: json['uid'] as String?,
      lockPin: json['lockPin'] as String?,
      isFingerprintAuthenticated:
          json['isFingerprintAuthenticated'] as bool? ?? false,
      isDarkTheme: json['isDarkTheme'] as bool?,
    );

Map<String, dynamic> _$InvestorToJson(Investor instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'dob': instance.dob,
      'lockPin': instance.lockPin,
      'isFingerprintAuthenticated': instance.isFingerprintAuthenticated,
      'isDarkTheme': instance.isDarkTheme,
    };
