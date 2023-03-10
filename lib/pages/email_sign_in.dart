import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wealthaccrue/pages/email_verify.dart';
import 'package:wealthaccrue/pages/verification_wait.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:validators/validators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../routers/router.gr.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailLinkPage extends ConsumerStatefulWidget {
  const EmailLinkPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EmailLinkPage> createState() => _EmailLinkPageState();
}

class _EmailLinkPageState extends ConsumerState<EmailLinkPage> {
  bool emailEntered = false;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // emailController.text = 'hack4pubg2000@gmail.com';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            // stops: [
            // 0.1,
            // 0.4,
            // 0.6,
            // 0.9,
            // ],
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              // Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: emailController,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
                keyboardType: TextInputType.emailAddress,
                // inputFormatters: [
                //   MaskedInputFormatter('##########',
                //       allowedCharMatcher: RegExp(r'[0-9]')),
                // ],

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                        width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                        width: 5.0),
                  ),
                  hintText: 'Enter your email id',
                ),
                onChanged: (email) {
                  if (isEmail(email)) {
                    ref.read(emailStateProvider.notifier).state = email;
                    emailEntered = true;
                    setState(() {});
                  } else {
                    emailEntered = false;
                    setState(() {});
                  }
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: emailEntered
                  ? () async {
                      final user = FirebaseAuth.instance.currentUser!;
                      ref.read(emailStateProvider.notifier).state =
                          emailController.text;
                      await user.updateEmail(emailController.text);
                      try {
                        await user.sendEmailVerification(ActionCodeSettings(
                            // URL you want to redirect back to. The domain (www.example.com) for this
                            // URL must be whitelisted in the Firebase Console.
                            url: 'https://wealthaccrue.page.link/welcome',
                            // This must be true
                            handleCodeInApp: true,
                            iOSBundleId: 'com.example.wealthaccrue',
                            androidPackageName: 'com.example.wealthaccrue',
                            // installIfNotAvailable
                            androidInstallApp: true,
                            // minimumVersion
                            androidMinimumVersion: '12'));
                        print(user.email);
                      } catch (error) {
                        // print(user.email);
                        print(error);
                        print("Error sending emailLink.");
                      } catch (e) {
                        print(e);
                      }
                      var success = await context.router
                          .push<bool>(VerificationWaitingRoute());
                      if (success == true) context.router.pop(true);
                    }
                  : null,
              child: const Text("Continue"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () async {
                final credential = await signInWithGoogle();
                
                var success;
                if (credential.user?.emailVerified == true) {
                  FirebaseAuth.instance.currentUser!
                      .updateEmail(credential.user!.email!);
                  success = await context.router.push<bool>(NameDetailsRoute());
                  if (success == true) context.router.pop(true);
                } else {
                  success = await context.router
                      .push<bool>(VerificationWaitingRoute());
                  if (success == true) context.router.pop(true);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Continue with "),
                  // FaIcon(FontAwesomeIcons.google),
                  const Text("google "),
                  const FaIcon(FontAwesomeIcons.google),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
