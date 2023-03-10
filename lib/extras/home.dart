import 'package:flutter/material.dart';
import 'whyInvesting.dart';
import 'package:page_transition/page_transition.dart';
import '../src/page_route_animations.dart';
import 'waHome.dart';
import 'alreadyAnInvestorFirst.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(231, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              child: const Text('New to Investing?'),
              onPressed: () {
                Navigator.of(context)
                    .push(SlidePageRoute(page: WhyInvestingScreen()));
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 146, 70, 181),
                  padding: const EdgeInsets.all(20),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text('Already an Investor'),
              onPressed: () {
                Navigator.of(context)
                    .push(SlidePageRoute(page: InvestorFirstScreen()));
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 124, 112, 130),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 81, 81, 81))),
            ),
          ],
        ),
      ),
    );
  }
}
