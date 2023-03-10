import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../src/extensions.dart';

class VerifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerifyPageState();
  }
}

class _VerifyPageState extends State<VerifyPage> {
  String string = '';
  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';
  String code5 = '';
  String code6 = '';
  bool verify = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verify', style: context.titleLarge),
          // iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 25.0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 16, top: 32),
                    child: Text(
                      'Verify your number',
                      style: context.headlineSmall,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 16, top: 8),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: '6 digit code sent to ',
                          style: context.titleLarge,
                        ),
                        TextSpan(
                          text: '+91 987 654 3210',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _inputFields(code1),
                        _inputFields(code2),
                        _inputFields(code3),
                        _inputFields(code4),
                        _inputFields(code5),
                        _inputFields(code6),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            // onSurface: Colors.red,
                            primary: Theme.of(context).colorScheme.error,
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          child: Text(
                            'Resend',
                            style: GoogleFonts.zenMaruGothic(
                                fontSize: 15,
                                color: Theme.of(context).colorScheme.error),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: verify
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                // Navigator.pushNamed(context, '/grocerry/home');
                              },
                              icon: const Icon(Icons.check),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('1'),
                      _createCalcButton('2'),
                      _createCalcButton('3'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('4'),
                      _createCalcButton('5'),
                      _createCalcButton('6'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton('7'),
                      _createCalcButton('8'),
                      _createCalcButton('9'),
                    ],
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _createCalcButton(''),
                      _createCalcButton('0'),
                      InkWell(
                          borderRadius: BorderRadius.circular(45),
                          onTap: () {
                            deleteCode();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              // decoration: BoxDecoration(shape: BoxShape.circle),
                              width: 50,
                              height: 50,
                              child: const Icon(Icons.backspace)))
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 55,
      child: Text(
        s,
        style: const TextStyle(fontSize: 28),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _createCalcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          updateCode(value);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12)),
          width: 50,
          height: 50,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  void updateCode(String value) {
    switch (string.length) {
      case 0:
        {
          setState(() {
            code1 = value;
          });
          break;
        }
      case 1:
        {
          setState(() {
            code2 = value;
          });
          break;
        }
      case 2:
        {
          setState(() {
            code3 = value;
          });
          break;
        }
      case 3:
        {
          setState(() {
            code4 = value;
          });
          break;
        }
      case 4:
        {
          setState(() {
            code5 = value;
          });
          break;
        }
      case 5:
        {
          setState(() {
            code6 = value;
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string += value;
    print(string);
    if (string.length > 5) {
      setState(() {
        verify = true;
      });
      return;
    } else {
      return;
    }
  }

  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          setState(() {
            code1 = '';
          });
          break;
        }
      case 2:
        {
          setState(() {
            code2 = '';
          });
          break;
        }
      case 3:
        {
          setState(() {
            code3 = '';
          });
          break;
        }
      case 4:
        {
          setState(() {
            code4 = '';
          });
          break;
        }
      case 5:
        {
          setState(() {
            code5 = '';
          });
          break;
        }
      case 6:
        {
          setState(() {
            code6 = '';
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string = string.substring(0, string.length - 1);
    if (string.length < 6) {
      setState(() {
        verify = false;
      });
    }
    print(string);
  }
}
