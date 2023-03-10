import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/page_route_animations.dart';
import 'package:wealthaccrue/pages/basic_account.dart';
import 'package:wealthaccrue/providers/global_providers.dart';

class LockPinSetupPage extends ConsumerStatefulWidget {
  const LockPinSetupPage({Key? key}) : super(key: key);

  @override
  _LockPinSetupPageState createState() => _LockPinSetupPageState();
}

class _LockPinSetupPageState extends ConsumerState<LockPinSetupPage> {
  bool? _canCheckBiometrics = false;
  final LocalAuthentication auth = LocalAuthentication();
  var i = 0;
  InputController pinController = InputController();
  String userPin = "";
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildAvailability(context),
                const SizedBox(height: 24),
                buildAuthenticate(context),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        context.router.pop(true);
                        // context.router.navigate(AccountRouter());
                      },
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      )),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildAvailability(BuildContext context) => buildButton(
        text: 'Set up a PIN',
        icon: Icons.key_rounded,
        onClicked: () async {
          screenLock<void>(
            context: context,
            correctString: '',
            digits: 4,
            confirmation: true,
            inputController: pinController,
            confirmTitle: const HeadingTitle(text: 'Please confirm passcode'),
            didConfirmed: (val) {
              setState(() {
                userPin = val;
                print(val);
                Navigator.pop(context);
                ref.read(lockPinStateProvider.notifier).state = userPin;
                investorsRef
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update(lockPin: userPin);
                Navigator.of(context)
                    .push(SlidePageRoute(page: const BasicAccountPage()));
              });
            },
            canCancel: false,
            footer: Container(
              padding: const EdgeInsets.only(top: 10),
              child: OutlinedButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          );
        },
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Authenticate with fingerprint',
        icon: Icons.fingerprint,
        onClicked: () async {
          _checkBiometrics;
          if (_canCheckBiometrics!) {
            final isAuthenticated = await auth.authenticate(
              localizedReason:
                  'Scan your fingerprint (or face or whatever) to authenticate',
              options: const AuthenticationOptions(
                useErrorDialogs: true,
                stickyAuth: true,
                biometricOnly: true,
              ),
            );
            if (isAuthenticated) {
              investorsRef
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .update(isFingerprintAuthenticated: true);
              Navigator.of(context)
                  .push(SlidePageRoute(page: const BasicAccountPage()));
            }
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.block,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Fingerprint Unavailable",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            );
          }
        },
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}
