import 'package:auto_route/auto_route.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wealthaccrue/extras/auth.dart';
import 'package:wealthaccrue/models/investor.dart' hide User;
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/page_route_animations.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:wealthaccrue/pages/name_details.dart';
import 'package:wealthaccrue/extras/setup_lock_pin.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:auth/auth.dart';

final auth = Auth();


final _firebaseAuth = FirebaseAuth.instance;


class EmailVerifyPage extends ConsumerStatefulWidget {
  const EmailVerifyPage({Key? key}) : super(key: key);

  @override
  _EmailVerifyPageState createState() => _EmailVerifyPageState();
}

class _EmailVerifyPageState extends ConsumerState<EmailVerifyPage> {
  bool emailEntered = false;
  TextEditingController emailController = TextEditingController();
  bool _isSigningIn = false;
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    // ref.read(emailStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    // var user;
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // ref.read(userProvider.notifier).state = user;
        
        print(user.uid);
      }
    });
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
      body: AuthFlowBuilder<EmailLinkFlowController>(
          config: EmailLinkProviderConfiguration(
              actionCodeSettings: ActionCodeSettings(
                  // URL you want to redirect back to. The domain (www.example.com) for this
                  // URL must be whitelisted in the Firebase Console.
                  url:
                      'https://wealthaccrue.page.link/welcome',
                  // This must be true
                  handleCodeInApp: true,
                  iOSBundleId: 'com.example.wealthaccrue',
                  androidPackageName: 'com.example.wealthaccrue',
                  // installIfNotAvailable
                  androidInstallApp: true,
                  // minimumVersion
                  androidMinimumVersion: '12')),
          builder: (context, state, controller, _) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: 25.0,
                    )
                  ],
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  BeautyTextfield(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_rounded),
                    placeholder: ref.watch(emailStateProvider),
                    textColor: Theme.of(context).colorScheme.primary,
                    accentColor: Theme.of(context).colorScheme.background,
                    onSubmitted: (email) {
                      setState(() {
                        emailEntered = EmailValidator.validate(email);
                        emailController.text = email;
                      });
                    },
                    fontStyle: FontStyle.normal,
                    onChanged: (email) {
                      setState(() {
                        emailEntered = EmailValidator.validate(email);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: emailEntered
                        ? () async {
                            ref.read(emailStateProvider.notifier).state =
                                emailController.text;
                            final authCredential = EmailAuthProvider
                                .credentialWithLink(email: emailController.text, emailLink: 'https://wealth-accrue.firebaseapp.com/__/auth/action?mode=action&oobCode=code');
                            // final authCredential  = controller.sendLink(emailController.text);
                            try {
                                await FirebaseAuth.instance.currentUser
                                    ?.linkWithCredential(authCredential);
                            } catch (error) {
                                print("Error linking emailLink credential.");
                            }
                            
                            // controller.sendLink(emailController.text);
                            if (state is SendingLink)
                              print("Sending Link!!!!!!!!!!!!!!!!!!");
                            if (state is AwaitingDynamicLink)
                              print("Awaiting dynamic link.!!!!!!!!!!!!!!!!");
                            if (state is SignedIn) {
                              // context.router.push(const NameDetailsRoute());
                            }
                          }
                        : null,
                    child: const Text("Continue"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.65,
                          MediaQuery.of(context).size.height * 0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // final credential = await signInWithGoogle();
                      // ref.read(userProvider.notifier).state = credential.user;
                      // context.router.push(const NameDetailsRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.65,
                          MediaQuery.of(context).size.height * 0.06),
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
                ],
              ),
            );
          }),
    );
  }
}
