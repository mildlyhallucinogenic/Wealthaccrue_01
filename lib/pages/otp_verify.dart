import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:intl/intl.dart';
import '../routers/router.gr.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage>
    with AutomaticKeepAliveClientMixin {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  NumberFormat formatter = NumberFormat("00");
  String _verificationCode = '';
  double opacity = 0.2;
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
    timer?.cancel();
  }

  bool showError = false;
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final length = 6;
    const borderColor = Color.fromARGB(255, 20, 60, 97);
    const errorColor = Color.fromARGB(255, 155, 68, 84);
    const fillColor = Color.fromARGB(255, 255, 255, 255);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    super.build(context);
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
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OtpHeader(),
              SizedBox(
                height: 90,
                child: Pinput(
                  validator: (value) {
                    // if (showError == true) return "Incorrect Pin";
                  },
                  length: length,
                  controller: controller,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  onCompleted: (pin) async {
                    try {
                      final result = await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin));

                      print(result.user.toString());

                      if (FirebaseAuth.instance.currentUser!.emailVerified &&
                          FirebaseAuth.instance.currentUser!.displayName !=
                              null) {
                        print("Email and name already verified");
                        timer!.cancel();
                        context.router.pop(true);
                      } else {
                        var success;
                        if (FirebaseAuth.instance.currentUser!.emailVerified ==
                            false) {
                          success = await context.router
                              .push<bool>(const EmailLinkRoute());
                        } else {
                          success = await context.router
                              .push<bool>(const NameDetailsRoute());
                        }

                        if (success == true) {
                          timer!.cancel();
                          context.router.pop(true);
                        }
                      }

                      // setState(() {
                      //   showError = false;
                      // });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      // _scaffoldkey.currentState!
                      //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: Text(
                            "Invalid OTP",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.onError,
                                ),
                          )));
                      showError = true;
                      setState(() {});
                      print(e.toString());
                    }
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    height: 68,
                    width: 64,
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: borderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: errorColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 54),
              Text(
                'Didn’t receive code?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: enableResend
                        ? () {
                            _verifyPhone();
                            setState(() {
                              secondsRemaining = 30;
                              enableResend = false;
                              opacity = 0.2;
                            });
                          }
                        : null,
                    child: Opacity(
                      opacity: opacity,
                      child: Text(
                        'Resend',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  Text(' 00:${formatter.format(secondsRemaining)} ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color:
                              Theme.of(context).colorScheme.onErrorContainer)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: ref.watch(phoneNumberStateProvider),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              // if (FirebaseAuth.instance.currentUser!.emailVerified) {
              //   context.router.pop(true);
              // }

              // var success =
              //     await context.router.push<bool>(VerificationWaitingRoute());
              // if (success == true) context.router.pop(true);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 30));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _verifyPhone();
    });
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          opacity = 1;
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class OtpHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Verification',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Enter the code sent to the number',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          ref.watch(phoneNumberStateProvider).toString(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 64)
      ],
    );
  }
}
