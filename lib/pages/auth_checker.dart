import 'package:auto_route/auto_route.dart';
import 'package:wealthaccrue/pages/splash_page.dart';
import 'package:wealthaccrue/providers/auth_provider.dart';
import 'package:wealthaccrue/routers/router.gr.dart';

import 'onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);

    return _authState.when(
        data: (user) {
          if (user != null) context.router.navigate(AccountRouter());
          return const OnboardPage();
        },
        loading: () => const SplashScreen(),
        error: (e, trace) => const OnboardPage());
  }
}
