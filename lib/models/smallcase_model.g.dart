// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smallcase_model.dart';

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
abstract class DataCollectionReference
    implements DataQuery, FirestoreCollectionReference<DataQuerySnapshot> {
  factory DataCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$DataCollectionReference;

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

  @override
  DataDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DataDocumentReference> add(Data value);
}

class _$DataCollectionReference extends _$DataQuery
    implements DataCollectionReference {
  factory _$DataCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$DataCollectionReference._(
      firestore.collection('smallcases').withConverter(
            fromFirestore: DataCollectionReference.fromFirestore,
            toFirestore: DataCollectionReference.toFirestore,
          ),
    );
  }

  _$DataCollectionReference._(
    CollectionReference<Data> reference,
  ) : super(reference, reference);

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
    return _$DataCollectionReference(reference.firestore);
  }

  @override
  Stream<DataDocumentSnapshot> snapshots();

  @override
  Future<DataDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

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
    return _$DataCollectionReference(reference.firestore);
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
