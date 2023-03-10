import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/extensions.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: 25.0,
                    )
                  ],
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign In',
                            style: context.titleLarge,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary),
                            // onSurface: Theme.of(context).colorScheme.onSurface,
                            elevation: MaterialStateProperty.all(0),
                          ),
                          child: Text('Sign Up', style: context.titleLarge),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Welcome to WealthAccrue',
                      style: context.headlineSmall,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, top: 8),
                    child: Text(
                      'Let\'s get started',
                      style: context.titleMedium,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 16, right: 16, top: 32, bottom: 8),
                  //   child: TextField(
                  //     style: TextStyle(fontSize: 18),
                  //     keyboardType: TextInputType.text,
                  //     textCapitalization: TextCapitalization.words,
                  //     decoration: InputDecoration(
                  //       hintText: 'Name',
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //         borderSide: BorderSide(
                  //             color: Theme.of(context).colorScheme.outline),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //           borderSide: BorderSide(
                  //               color: Theme.of(context).colorScheme.outline)),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'E-Mail Address',
                        // hintStyle: GoogleFonts.zenMaruGothic(fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline)),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  //   child: TextField(
                  //     obscureText: true,
                  //     style: TextStyle(fontSize: 18),
                  //     keyboardType: TextInputType.text,
                  //     decoration: InputDecoration(
                  //       hintText: 'Password',
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //           borderSide: BorderSide(
                  //               color: Theme.of(context).colorScheme.outline)),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //           borderSide: BorderSide(
                  //               color: Theme.of(context).colorScheme.outline)),
                  //     ),
                  //   ),
                  // ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.rectangle),
                          child: TextButton(
                            child: Text("Continue with Google"),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: Theme.of(context).colorScheme.surface,
                            ),
                          ))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle),
                        child: IconButton(
                          color: Theme.of(context).colorScheme.surface,
                          onPressed: () {
                            // Navigator.pushNamed(context, '/grocerry/verify');
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
