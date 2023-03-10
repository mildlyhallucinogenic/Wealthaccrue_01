import 'dart:async';
// import 'dart:html';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/page_route_animations.dart';
import 'package:wealthaccrue/pages/email_verify.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:sms_autofill/sms_autofill.dart';

// final auth = PhoneAuthFlow();

class OtpCodeVerifyPage extends ConsumerStatefulWidget {
  const OtpCodeVerifyPage({Key? key}) : super(key: key);

  @override
  _OtpCodeVerifyPageState createState() => _OtpCodeVerifyPageState();
}

class _OtpCodeVerifyPageState extends ConsumerState<OtpCodeVerifyPage> {
  var onTapRecognizer;

  late StreamController<ErrorAnimationType> errorController;
  final SmsAutoFill _autoFill = SmsAutoFill();
  String verificationId = '';
  final TextEditingController _smsController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  void listenOTP() async {
    print('listen for code');
    await _autoFill.listenForCode;
  }

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // sendSMS();
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    listenOTP();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  // Future sendSMS() async {
  //   // await _autoFill.listenForCode;
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: ref.watch(phoneNumberStateProvider),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         print("Verification Completed");
  //         await _auth.signInWithCredential(credential);
  //       },
  //       verificationFailed: (FirebaseAuthException e) async {
  //         if (e.code == 'invalid-phone-number') {
  //           print('The provided phone number is not valid.');
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         // Update the UI - wait for the user to enter the SMS code
  //         String smsCode = '';
  //         if (_smsController.text.length == 6) smsCode = _smsController.text;
  //         // _smsController.text = smsCode;
  //         // }

  //         print(_autoFill.code.toString());

  //         // Create a PhoneAuthCredential with the code
  //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //             verificationId: verificationId, smsCode: smsCode);

  //         // Sign the user in (or link) with the credential
  //         // await _auth.signInWithCredential(credential);
  //       },
  //       timeout: const Duration(seconds: 60),
  //       codeAutoRetrievalTimeout: (String verificationId) async {
  //         print("verification code: " + verificationId);
  //       },
  //     );
  //     // ConfirmationResult confirmationResult = await _auth.signInWithPhoneNumber(ref.watch(phoneNumberStateProvider));
  //     // UserCredential userCredential = await confirmationResult.confirm('123456');
  //   } catch (e) {
  //     print("Failed to Verify Phone Number: ${e}");
  //   }
  // }

  // void signInWithPhoneNumber() async {
  //   try {
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: _smsController.text,
  //     );

  //     final User user = (await _auth.signInWithCredential(credential)).user!;

  //     print("Successfully signed in UID: ${user.uid}");
  //   } catch (e) {
  //     print("Failed to sign in: " + e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ref.watch(phoneNumberStateProvider);
    // sendSMS();
    // signInWithPhoneNumber();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: AutoLeadingButton(),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      key: scaffoldKey,
      body: AuthFlowBuilder<PhoneAuthController>(
          listener: (oldState, state, controller) {
        if (state is PhoneVerified) {
          // context.router.push(EmailVerifyRoute());
        }
      }, builder: (context, state, controller, _) {
        if (state is SMSCodeRequested) {
          // ...
          
          print("SMS is requested");
        } else if (state is SMSCodeSent) {
          print("SMS is sent");
          controller.reset();
          // ...
        } else if (state is AwaitingPhoneNumber) {
          controller.acceptPhoneNumber(phoneNumber);
          // ...
        } else if (state is PhoneVerificationFailed ) {
          // FlutterFireUIWidget that shows a human-readable error message.
          return ErrorText(exception: state.exception);
        }
        print(state);
        return GestureDetector(
          onTap: () {},
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 30),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.6,
                  child: const FlareActor(
                    "images/otp.flr",
                    animation: "otp",
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Phone Number Verification',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Enter the code sent to ",
                        children: [
                          TextSpan(
                              text: phoneNumber,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 15)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 6) {
                            // FocusScope.of(context).requestFocus(FocusNode());
                            return "Please fill the complete otp";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor:
                              hasError ? Colors.orange : Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        textStyle: const TextStyle(fontSize: 20, height: 1.6),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: _smsController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        // color: Theme.of(context).colorScheme.error,
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Didn't receive the code? ",
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 15),
                      children: [
                        TextSpan(
                            text: " RESEND",
                            recognizer: onTapRecognizer,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ]),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        formKey.currentState!.validate();
                        // conditions for validating
                        if (currentText.length != 6 ||
                            currentText != _smsController.text) {
                          errorController.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          setState(() {
                            hasError = true;
                          });
                        } else {
                          setState(() {
                            hasError = false;
                          });
                          // signInWithPhoneNumber();
                          controller.verifySMSCode(currentText);
                          // context.router.push(const EmailVerifyRoute());
                        }
                      },
                      child: Center(
                          child: Text(
                        "VERIFY".toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: const Offset(1, -2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.green.shade200,
                            offset: const Offset(-1, 2),
                            blurRadius: 5)
                      ]),
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text("Clear"),
                      onPressed: () {
                        _smsController.clear();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
