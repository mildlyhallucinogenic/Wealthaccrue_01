import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wealthaccrue/src/theme.dart';

import '../routers/router.gr.dart';

class OnboardPage extends ConsumerStatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends ConsumerState<OnboardPage> {
  String _verificationCode = '';
  TextEditingController phoneController = TextEditingController()
    ..text = '9999999999';

  bool phoneEntered = false;

  Future<void> createInvestorProfile(WidgetRef ref) async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await investorsRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((documentSnapshot) async {
      if (documentSnapshot.exists == false) {
        await investorsRef.doc(FirebaseAuth.instance.currentUser!.uid).set(
            Investor(
                uid: FirebaseAuth.instance.currentUser!.uid,
                name: FirebaseAuth.instance.currentUser!.displayName ?? '',
                email: FirebaseAuth.instance.currentUser!.email ?? '',
                phone: FirebaseAuth.instance.currentUser!.phoneNumber ?? '',
                dob: ref.watch(dobStateProvider),
                lockPin: ref.watch(lockPinStateProvider)));
      }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome to ",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "WealthAccrue",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                            width: 5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Center(
                        child: Text(
                          "+91",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: phoneController,
                        onTap: () {
                          setState(() {});
                        },
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          MaskedInputFormatter('##########',
                              allowedCharMatcher: RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.background,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 5.0),
                          ),
                          // hintText: 'Mobile Number',
                        ),
                        onChanged: (phone) {
                          if (phone.length == 10) {
                            ref.read(phoneNumberStateProvider.notifier).state =
                                '+91' + phone;
                            phoneEntered = true;
                            setState(() {});
                          } else {
                            phoneEntered = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (phoneEntered) ...[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ))),
                      onPressed: () async {
                        var result =
                            await context.router.push<bool>(const OtpRoute());
                        if (result == true) {
                          ref.refresh(themeModeProvider);
                          context.router.pop();
                          context.router.push(const SplashRoute());
                          createInvestorProfile(ref);
                          await Future.delayed(
                              const Duration(milliseconds: 5000));

                          context.router.replaceAll([const UserRoute()]);
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                      )),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
