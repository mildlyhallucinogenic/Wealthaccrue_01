import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:quiver/strings.dart';
import 'package:intl/intl.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/page_route_animations.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:wealthaccrue/extras/setup_lock_pin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameDetailsPage extends ConsumerStatefulWidget {
  const NameDetailsPage({Key? key}) : super(key: key);

  @override
  _NameDetailsPageState createState() => _NameDetailsPageState();
}

class _NameDetailsPageState extends ConsumerState<NameDetailsPage> {
  final formGlobalKey = GlobalKey<FormState>();
  // final firstKey = GlobalKey<FormState>();
  // final lastKey = GlobalKey<FormState>();
  // final dobKey = GlobalKey<FormState>();

  DateTime _date = DateTime.now();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            // stops: [
            // 0.1,
            // 0.4,
            // 0.6,
            // 0.9,
            // ],
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              // Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
        child: Form(
          key: formGlobalKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "First Name",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // height: MediaQuery.of(context).size.height * 0.08,
                  child: TextFormField(
                    // key: firstKey,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    validator: (firstName) {
                      if (isNotEmpty(firstName)) {
                        return null;
                      } else {
                        return '*This field is required';
                      }
                    },
                    onChanged: (firstName) {
                      if (isNotEmpty(firstName)) {
                        formGlobalKey.currentState!.validate();
                        // firstKey.currentState!.validate();
                      }
                      setState(() {});
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      LengthLimitingTextInputFormatter(15),
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+')),
                      UpperCaseTextFormatter()
                    ],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                    controller: firstNameController,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(
                      //     horizontal: 12, vertical: 0),
                      focusColor: Theme.of(context).colorScheme.background,
                      fillColor: Theme.of(context).colorScheme.background,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      errorStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Last Name",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    // key: formGlobalKey,
                    onChanged: (val) {
                      if (isNotEmpty(val)) {
                        formGlobalKey.currentState!.validate();
                      }
                    },
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                    controller: lastNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.background,
                      focusColor: Theme.of(context).colorScheme.background,
                      // hintText: 'Last Name',
                      // hintStyle: GoogleFonts.zenMaruGothic(fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      errorStyle: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    validator: (lastName) {
                      if (isNotEmpty(lastName)) {
                        return null;
                      } else {
                        return "*This field id required";
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      LengthLimitingTextInputFormatter(15),
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+')),
                      UpperCaseTextFormatter()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Date of Birth",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    // key: formGlobalKey,

                    keyboardType: TextInputType.datetime,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                    controller: birthDateController,
                    inputFormatters: [
                      MaskedInputFormatter(
                        '##/##/####',
                        allowedCharMatcher: RegExp(r'[0-9]'),
                      ),
                      // DateInputFormatter()
                    ],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _date,
                            firstDate: DateTime(1965),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            setState(() {
                              _date = date!;
                              birthDateController.text =
                                  DateFormat('dd/MM/yyyy').format(_date);
                            });
                          });
                        },
                        icon: const Icon(Icons.event_rounded),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                      hintText: 'DD/MM/YYYY',
                      hintStyle: TextStyle(color: Theme.of(context).hintColor),
                      // hintStyle: GoogleFonts.zenMaruGothic(fontSize: 16),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          width: 5,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      errorStyle: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    onChanged: (date) {
                      if (date.length == 10) {
                        print(DateFormat('dd/mm/yyyy').parse(date));
                      }
                    },
                    validator: (date) {
                      if (date == null || date.isEmpty) {
                        return "*This field is required";
                      }
                      final components = date.split("/");
                      if (components.length == 3) {
                        final day = int.tryParse(components[0]);
                        final month = int.tryParse(components[1]);
                        final year = int.tryParse(components[2]);
                        if (day != null && month != null && year != null) {
                          final date = DateTime(year, month, day);
                          if (date.year == year &&
                              date.month == month &&
                              date.day == day &&
                              year > 1964 &&
                              year <= DateTime.now().year - 19) {
                            return null;
                          }
                        }
                      }
                      return "*Date is Invalid";
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formGlobalKey.currentState!.validate()) {
                      formGlobalKey.currentState!.save();

                      ref.read(firstNameStateProvider.notifier).state =
                          firstNameController.text;
                      ref.read(lastNameStateProvider.notifier).state =
                          lastNameController.text;
                      ref.read(dobStateProvider.notifier).state =
                          birthDateController.text;
                      FirebaseAuth.instance.currentUser!.updateDisplayName(
                          firstNameController.text +
                              ' ' +
                              lastNameController.text);
                      
                      context.router.pop(true);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}
