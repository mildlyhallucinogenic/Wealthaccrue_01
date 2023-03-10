import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
// import 'package:wealthaccrue/auth.dart';
import 'package:wealthaccrue/routers/auth_guard.dart';
import 'package:wealthaccrue/routers/router.gr.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'src/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:bloc/bloc.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAnalytics? analytics;

const bool USE_EMULATOR = false;
ThemeMode _theme = ThemeMode.system;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  analytics = FirebaseAnalytics.instance;
  if (USE_EMULATOR) {
    _connectToFirebaseEmulator();
  }
  await setTheme();
  runApp(
    ProviderScope(
      child: WealthAccrue(),
    ),
  );
}

Future setTheme() async {
  if (FirebaseAuth.instance.currentUser != null) {
    // return null;
    await investorsRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.data != null && value.data!.isDarkTheme != null) {
        print(value.data!.isDarkTheme);
        if (value.data!.isDarkTheme == true) {
          _theme = ThemeMode.dark;
          // print(theme.name);
        } else if (value.data!.isDarkTheme == false) {
          print("Light theme - Set Theme");
          _theme = ThemeMode.light;
        }
      }
    });
  }
  print(_theme.name);
  return true;
}

Future _connectToFirebaseEmulator() async {
  // var firebaseConfig = await readJsonFile('firebase.json');
  const fireStorePort = 8080;
  const authPort = 9099;
  const storagePort = 9199;
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  FirebaseFirestore.instance.settings = Settings(
      host: "$localHost:$fireStorePort",
      sslEnabled: false,
      persistenceEnabled: false);
  // await FirebaseStorage.instance.useStorageEmulator(localHost, storagePort);
  await FirebaseAuth.instance.useAuthEmulator(localHost, authPort);
}

class WealthAccrue extends ConsumerWidget {
  WealthAccrue({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.refresh(themeModeProvider);
    final settings = ValueNotifier(ThemeSettings(
      sourceColor: Color.fromARGB(255, 8, 41, 57),
      themeMode: ref.watch(themeModeProvider).hasValue
          ? (ref.watch(themeModeProvider).value == null
              ? _theme
              : ref.watch(themeModeProvider).value!)
          : _theme,
    ));
    if (FirebaseAuth.instance.currentUser != null) {
      print("Authenticated");
      // FirebaseAuth.instance.signOut();
    }
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'WealthAccrue',
                  theme: theme.light(settings.value.sourceColor),
                  darkTheme: theme.dark(settings.value.sourceColor),
                  themeMode: theme.themeMode(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: _appRouter.delegate(),
                );
              },
            ),
          )),
    );
  }
}
