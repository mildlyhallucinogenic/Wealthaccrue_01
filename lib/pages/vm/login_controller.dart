import 'package:firebase_auth/firebase_auth.dart';
import 'login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealthaccrue/providers/auth_provider.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String phoneNumber, String code) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).loginWithPhoneNumber(
            phoneNumber,
            code,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authRepositoryProvider).logOut();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});