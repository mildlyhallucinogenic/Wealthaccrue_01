// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

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
abstract class PortfolioCollectionReference
    implements
        PortfolioQuery,
        FirestoreCollectionReference<PortfolioQuerySnapshot> {
  factory PortfolioCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PortfolioCollectionReference;

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

  @override
  PortfolioDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PortfolioDocumentReference> add(Portfolio value);
}

class _$PortfolioCollectionReference extends _$PortfolioQuery
    implements PortfolioCollectionReference {
  factory _$PortfolioCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PortfolioCollectionReference._(
      firestore.collection('portfolios').withConverter(
            fromFirestore: PortfolioCollectionReference.fromFirestore,
            toFirestore: PortfolioCollectionReference.toFirestore,
          ),
    );
  }

  _$PortfolioCollectionReference._(
    CollectionReference<Portfolio> reference,
  ) : super(reference, reference);

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
    return _$PortfolioCollectionReference(reference.firestore);
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
    return _$PortfolioCollectionReference(reference.firestore);
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

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) => Portfolio(
      values: (json['values'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$PortfolioToJson(Portfolio instance) => <String, dynamic>{
      'values': instance.values,
    };
