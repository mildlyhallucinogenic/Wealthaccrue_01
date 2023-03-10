import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/phone_number.dart';

class AuthRepository {
  const AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get authStateChange => _auth.userChanges();

  Future<User?> loginWithPhoneNumber(String phoneNumber, String code) async {
    try {
      final result = await _auth.signInWithPhoneNumber(phoneNumber);
      final credential = await result.confirm(code);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password');
      } else {
        throw AuthException('An error occured. Please try again later');
      }
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}
