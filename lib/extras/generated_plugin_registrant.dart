//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:cloud_functions_web/cloud_functions_web.dart';
import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_app_check_web/firebase_app_check_web.dart';
import 'package:firebase_auth_oauth_web/firebase_auth_oauth_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_database_web/firebase_database_web.dart';
import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:firebase_performance_web/firebase_performance_web.dart';
import 'package:flutter_facebook_auth_web/flutter_facebook_auth_web.dart';
import 'package:flutter_keyboard_visibility_web/flutter_keyboard_visibility_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:sign_in_with_apple_web/sign_in_with_apple_web.dart';
import 'package:smart_auth/smart_auth_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FirebaseFirestoreWeb.registerWith(registrar);
  FirebaseFunctionsWeb.registerWith(registrar);
  FirebaseAnalyticsWeb.registerWith(registrar);
  FirebaseAppCheckWeb.registerWith(registrar);
  FirebaseAuthOAuthWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FirebaseDatabaseWeb.registerWith(registrar);
  FirebaseMessagingWeb.registerWith(registrar);
  FirebasePerformanceWeb.registerWith(registrar);
  FlutterFacebookAuthPlugin.registerWith(registrar);
  FlutterKeyboardVisibilityPlugin.registerWith(registrar);
  GoogleSignInPlugin.registerWith(registrar);
  SignInWithApplePlugin.registerWith(registrar);
  SmartAuthWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
