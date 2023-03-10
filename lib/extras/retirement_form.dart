import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class RetirementCalculator extends StatefulWidget {
  const RetirementCalculator({Key? key}) : super(key: key);

  @override
  State<RetirementCalculator> createState() => _RetirementCalculatorState();
}

class _RetirementCalculatorState extends State<RetirementCalculator> {
  @override
  TextEditingController sipInput = TextEditingController(text: "5000");
  TextEditingController alreadyInvestedInput = TextEditingController(text: "0");
  TextEditingController returnInput = TextEditingController(text: "15");
  TextEditingController timeInput = TextEditingController(text: "20");

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("0%"), value: "0"),
      // DropdownMenuItem(child: Text("1%"), value: "1"),
      // DropdownMenuItem(child: Text("2%"), value: "2"),
      // DropdownMenuItem(child: Text("3%"), value: "3"),
      // DropdownMenuItem(child: Text("4%"), value: "4"),
      DropdownMenuItem(child: Text("5%"), value: "5"),
      // DropdownMenuItem(child: Text("6%"), value: "6"),
      // DropdownMenuItem(child: Text("7%"), value: "7"),
      // DropdownMenuItem(child: Text("8%"), value: "8"),
      // DropdownMenuItem(child: Text("9%"), value: "9"),
      DropdownMenuItem(child: Text("10%"), value: "10"),
      // DropdownMenuItem(child: Text("11%"), value: "11"),
      // DropdownMenuItem(child: Text("12%"), value: "12"),
      // DropdownMenuItem(child: Text("13%"), value: "13"),
      // DropdownMenuItem(child: Text("14%"), value: "14"),
      DropdownMenuItem(child: Text("15%"), value: "15"),
      // DropdownMenuItem(child: Text("16%"), value: "16"),
      // DropdownMenuItem(child: Text("17%"), value: "17"),
      // DropdownMenuItem(child: Text("18%"), value: "18"),
      // DropdownMenuItem(child: Text("19%"), value: "19"),
      DropdownMenuItem(child: Text("20%"), value: "20"),
    ];
    return menuItems;
  }

  String selectedValue = "5";

  String addVal = "";
  /*

  Amount already invested
  Monthly Sip 
  SIP increment(every year)  - Dropdown field
  Inflation : 6%
  Time

  */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wealth Calculator"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // const Center(
                //   child: Text(
                //     "Wealth Calculator",
                //     style: TextStyle(fontSize: 24),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      "Monthly SIP:  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: sipInput,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          // LengthLimitingTextInputFormatter(2),
                          // LimitRangeTextInputFormatter(5000, 200000),
                          // ThousandsFormatter()
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: <Widget>[
                //     Wrap(
                //       children: const [
                //         Text(
                //           "Amount already invested:  ",
                //           maxLines: 2,
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //     Expanded(
                //       flex: 1,
                //       child: SizedBox(
                //         width: 200,
                //         child: TextFormField(
                //           controller: alreadyInvestedInput,
                //           decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(8))),
                //         ),
                //       ),
                //     )
                //   ],
                // ),

                // Text(alreadyInvestedInput.toString()),
                Row(
                  children: <Widget>[
                    const Text(
                      "SIP Increment(%):  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(width: 2),
                              //   borderRadius: BorderRadius.circular(20),
                              // )
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              filled: true,
                            ),
                            // dropdownColor: ,
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems))
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      "Return Rate(%):  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: returnInput,
                        decoration: InputDecoration(
                            hintText: "upto 40%",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                          LimitRangeTextInputFormatter(0, 50),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: <Widget>[
                    const Text(
                      "Tenure:  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: timeInput,
                        decoration: InputDecoration(
                            hintText: "upto 50 yrs",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                          LimitRangeTextInputFormatter(0, 50),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      addVal = (int.parse(sipInput.text) *
                              pow((int.parse(returnInput.text) / 100 + 1),
                                  int.parse(timeInput.text)))
                          .toString();
                    },
                    child: Text("Calculate Returns")),

                SizedBox(
                  height: 20,
                ),

                Text(
                  "Total wealth accrued:  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

                Text(
                  ("₹" + addVal),
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return TextEditingValue().copyWith(text: min.toStringAsFixed(2));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
