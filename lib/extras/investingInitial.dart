import 'package:flutter/material.dart';

class InvestingPreLoginScreen extends StatelessWidget {
  const InvestingPreLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investing"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.purple, fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "Investing in equity is best done by having a well-balances portfolio of all kinds stocks. "),
                        TextSpan(
                            text: "Growth Stocks ",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "to grow money faster, established company stocks for good "),
                        TextSpan(
                            text: "Dividend Income ",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        TextSpan(text: "and blue chip stocks to provide "),
                        TextSpan(
                            text: "stability. ",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "The weightage of each of these and more can be based on your "),
                        TextSpan(
                            text: "Risk Appetite.",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Calculate my Risk Appetite",
                  style: TextStyle(fontSize: 23),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    fixedSize: MaterialStateProperty.all(const Size(350, 70))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "See sample portfolios",
                  style: TextStyle(fontSize: 23),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 72, 72, 72)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 140, 140, 140)),
                    fixedSize: MaterialStateProperty.all(const Size(350, 70))),
              ),
            ]),
      ),
    );
  }
}
