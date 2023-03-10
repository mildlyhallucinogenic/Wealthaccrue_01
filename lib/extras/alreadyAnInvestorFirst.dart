// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/page_route_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class InvestorFirstScreen extends StatefulWidget {
  const InvestorFirstScreen({Key? key}) : super(key: key);

  @override
  State<InvestorFirstScreen> createState() => _InvestorFirstScreenState();
}

class _InvestorFirstScreenState extends State<InvestorFirstScreen> {
  bool stocksFlag = false;
  bool fundsFlag = false;
  bool smallcasesFlag = false;
  bool etfsFlag = false;
  bool goldFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What have you invested in?",
              style: GoogleFonts.roboto(
                  color: Colors.purple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                trailing: stocksFlag
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[800],
                      )
                    : const Icon(Icons.circle_outlined, color: Colors.black),
                title: Text(
                  "Stocks",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    stocksFlag = (!stocksFlag);
                  });
                }),
            ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                trailing: fundsFlag
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[800],
                      )
                    : const Icon(Icons.circle_outlined, color: Colors.black),
                title: Text(
                  "Mutual Funds",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    fundsFlag = (!fundsFlag);
                  });
                }),
            ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                trailing: smallcasesFlag
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[800],
                      )
                    : const Icon(Icons.circle_outlined, color: Colors.black),
                title: Text(
                  "Smallcases",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    smallcasesFlag = (!smallcasesFlag);
                  });
                }),
            ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                trailing: etfsFlag
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[800],
                      )
                    : const Icon(Icons.circle_outlined, color: Colors.black),
                title: Text(
                  "ETFs",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    etfsFlag = (!etfsFlag);
                  });
                }),
            ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 40,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                trailing: goldFlag
                    ? Icon(
                        Icons.check,
                        size: 30,
                        color: Colors.green[800],
                      )
                    : const Icon(Icons.circle_outlined, color: Colors.black),
                title: Text(
                  "Gold",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                onTap: () {
                  setState(() {
                    goldFlag = (!goldFlag);
                  });
                }),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Done",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  minimumSize: MaterialStateProperty.all(const Size(150, 40))),
            )
          ],
        ),
      )),
    );
  }
}
