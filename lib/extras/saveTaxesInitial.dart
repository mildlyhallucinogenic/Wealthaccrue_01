import 'package:flutter/material.dart';

class SaveTaxesPreLoginScreen extends StatelessWidget {
  const SaveTaxesPreLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Taxes"),
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
                      style: TextStyle(color: Colors.purple, fontSize: 28),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "Tax saving can be done efficiently by investing money in "),
                        TextSpan(
                            text: "ELSS mutual Funds.",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                " It is the perfect solution to investing in equity and saving taxes. And you can save upto"),
                        TextSpan(
                            text: " ₹1,50,000 ",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        TextSpan(text: "in taxes."),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Top ELSS Mutual Funds",
                  style: TextStyle(fontSize: 30),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    fixedSize: MaterialStateProperty.all(const Size(350, 90))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Go Back",
                  style: TextStyle(fontSize: 30),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 72, 72, 72)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 140, 140, 140)),
                    fixedSize: MaterialStateProperty.all(const Size(350, 90))),
              ),
            ]),
      ),
    );
  }
}
