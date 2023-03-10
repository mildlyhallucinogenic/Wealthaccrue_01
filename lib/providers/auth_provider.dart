import 'package:firebase_auth/firebase_auth.dart';
import 'package:wealthaccrue/apis/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/models/mutual_fund_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChange;
});

// final firebaseAuthProvider =
//     Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// 2
final userChangesProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.userChanges());

// 3
// final databaseProvider = Provider<FirebaseFirestore?>((ref) {
//   final auth = ref.watch(authStateChangesProvider);

//   // we only have a valid DB if the user is signed in
//   if (auth.asData?.value.uid != null) {
//     return FirebaseFirestore.instance(uid: auth.data!.value!.uid);
//   }
//   // else we return null
//   return null;
// });

// final holdingsProvider = Provider<Holdings>(
//   (ref) {
//     final userStream = ref.watch(userChangesProvider);

//     var user = userStream.value; //.asData?.value;

//     if (user != null) {
//       final docRef =  holdingsRef.doc(user.uid).select((snapshot) => snapshot.data);
//       return docRef;
//     } else {
//       return const Stream.empty();
//     }
//   },
// );
