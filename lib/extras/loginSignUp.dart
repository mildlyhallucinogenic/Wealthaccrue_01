import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/page_route_animations.dart';
import 'login.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WealthAccrue",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 50,
              shadows: [const Shadow(color: Colors.black)],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: const Icon(
              Icons.circle,
              color: Colors.white,
            ),
            title: Text(
              "data",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: const Icon(
              Icons.circle,
              color: Colors.white,
            ),
            title: Text(
              "data",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: const Icon(
              Icons.circle,
              color: Colors.white,
            ),
            title: Text(
              "data",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            leading: const Icon(
              Icons.circle,
              color: Colors.white,
            ),
            title: Text(
              "data",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(SlidePageRoute(page: const LoginScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(100, 40)),
                ),
                const VerticalDivider(
                  width: 0,
                  thickness: 1,
                  endIndent: 0,
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(100, 40)),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
