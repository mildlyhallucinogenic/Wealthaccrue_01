import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wealthaccrue/models/investor.dart';

import 'theme.dart';

class BrightnessToggle extends StatelessWidget {
  const BrightnessToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      icon: Theme.of(context).brightness == Brightness.light
          ? const Icon(Icons.brightness_3)
          : const Icon(Icons.brightness_7),
      onPressed: () {
        print("Brightness toggled");
        investorsRef
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(isDarkTheme: isDark ? false : true);
        final themeProvider = ThemeProvider.of(context);
        final settings = themeProvider.settings.value;
        final newSettings = ThemeSettings(
          sourceColor: settings.sourceColor,
          themeMode: isDark ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(settings: newSettings).dispatch(context);
      },
    );
  }
}
