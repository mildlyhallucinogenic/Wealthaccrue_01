import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:wealthaccrue/routers/router.gr.dart';

class VerificationWaitingPage extends ConsumerStatefulWidget {
  const VerificationWaitingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<VerificationWaitingPage> createState() =>
      _VerificationWaitingPageState();
}

class _VerificationWaitingPageState
    extends ConsumerState<VerificationWaitingPage> {
  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  int counter = 0;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        setState(() {});
      }
      FirebaseAuth.instance.currentUser!.reload();
      print(FirebaseAuth.instance.currentUser!.emailVerified.toString() +
          '${counter++}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
            // Theme.of(context).colorScheme.tertiary,
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (FirebaseAuth.instance.currentUser!.emailVerified == true) ...[
                Text(
                  "Great! Just a few more details to go. Let's continue",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async{
                    var success = await context.router
                      .push<bool>(const NameDetailsRoute());
                    if (success == true) context.router.pop(true);
                  },
                  child: const Text("Continue"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
              if (FirebaseAuth.instance.currentUser!.emailVerified ==
                  false) ...[
                Text(
                  "We'll wait for you to get back",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).colorScheme.surface,
                  size: 80,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
