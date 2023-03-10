import 'package:flutter/material.dart';

class RetireEarlyPreLoginScreen extends StatelessWidget {
  const RetireEarlyPreLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retire Early"),
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
                        TextSpan(text: "Early retirement is "),
                        TextSpan(
                            text: "possible.",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        TextSpan(text: " One way to get there is by setting a"),
                        TextSpan(
                            text: " Retirement Goal ",
                            style: TextStyle(
                                fontSize: 33, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "that can be reached by investing regularly. A realistic goal can be calculated based on one's expenses and income. Cick below to see how early you can retire."),
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Calculate my Retirement Goal",
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
                  "Go Back",
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
