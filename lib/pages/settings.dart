import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealthaccrue/pages/vm/login_controller.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/brightness_toggle.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:wealthaccrue/src/theme.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // final isDark = ref.watch(isDarkThemeProvider) as bool;
    // print(isDark);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          height: height * 0.15,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    // "John Doe",
                    (FirebaseAuth.instance.currentUser!.displayName == null)
                        ? 'John Doe'
                        : FirebaseAuth.instance.currentUser!.displayName!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          height: height * 0.1,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Theme",
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
              const BrightnessToggle()
            ],
          ),
        ),
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          height: height * 0.1,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    
                    FirebaseAuth.instance.signOut();
                    context.router.replaceAll([LoginRoute()]);
                  },
                  icon: Icon(Icons.logout_rounded))
            ],
          ),
        )
      ]),
    );
  }
}
