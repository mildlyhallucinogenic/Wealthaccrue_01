import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/src/theme.dart';
import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  bool authenitcated = false;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.displayName != null) {
      authenitcated = true;
    }

    if (authenitcated) {
      // if user is authenticated we continue
      print('Authenticated - Auth Guard');
      // FirebaseAuth.instance.signOut();
      resolver.next(true);

      // router.pushAll([AccountRouter()]);
      // router.navigate(UserRoute());
    } else {
      // we redirect the user to our login page
      router.push(const LoginRoute());
    }
  }
}
