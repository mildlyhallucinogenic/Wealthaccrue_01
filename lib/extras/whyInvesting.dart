import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'earlyRetirementInitial.dart';
import 'saveTaxesInitial.dart';
import 'investingInitial.dart';
import '../src/page_route_animations.dart';

class WhyInvestingScreen extends StatelessWidget {
  const WhyInvestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60),
        color: const Color.fromRGBO(255, 255, 255, 0.7),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Why made you look up \"Investing\"?",
              style: TextStyle(
                color: Color.fromARGB(255, 146, 70, 181),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageRoute(page: SaveTaxesPreLoginScreen()));
              },
              child: const Text("Trying to save taxes"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 72, 72, 72)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 140, 140, 140)),
                  fixedSize: MaterialStateProperty.all(const Size(300, 40))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageRoute(page: RetireEarlyPreLoginScreen()));
              },
              child: const Text("Looking to retire early"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 72, 72, 72)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 140, 140, 140)),
                  fixedSize: MaterialStateProperty.all(const Size(300, 40))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageRoute(page: InvestingPreLoginScreen()));
              },
              child: const Text("Want my money to work for me"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 72, 72, 72)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 140, 140, 140)),
                  fixedSize: MaterialStateProperty.all(const Size(300, 40))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageRoute(page: InvestingPreLoginScreen()));              },
              child: const Text("I have extra money!"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 72, 72, 72)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 140, 140, 140)),
                  fixedSize: MaterialStateProperty.all(const Size(300, 40))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageRoute(page: InvestingPreLoginScreen()));
              },
              child: const Text("Someone told me to"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 72, 72, 72)),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 140, 140, 140)),
                  fixedSize: MaterialStateProperty.all(const Size(300, 40))),
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute(String? page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (page){
          case 'Taxes':
            return SaveTaxesPreLoginScreen();
          case 'Retire':
            return RetireEarlyPreLoginScreen();
          default:
            return InvestingPreLoginScreen();
        };
      },
    
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
