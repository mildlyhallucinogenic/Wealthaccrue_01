import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:quiver/time.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/src/extensions.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wealthaccrue/src/page_route_animations.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AppIntroPage extends ConsumerStatefulWidget {
  const AppIntroPage({Key? key}) : super(key: key);

  @override
  _AppIntroPageState createState() => _AppIntroPageState();
}

class _AppIntroPageState extends ConsumerState<AppIntroPage> {
  List<Slide> slides = [];

  late Function goToTab;
  TextEditingController controller = TextEditingController();
  bool submitShow = false;
  @override
  void initState() {
    super.initState();
    ref.read(phoneNumberStateProvider);
    slides.add(
      Slide(
        title: "ERASER",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/invest.webp",
        backgroundColor: const Color(0xfff5a623),
      ),
    );
    slides.add(
      Slide(
        title: "PENCIL",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/goals.png",
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "RULER",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/retirement_planning.png",
        backgroundColor: const Color(0xff9932CC),
      ),
    );
  }

  void onTabChangeCompleted(index) {
    // goToTab(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: IntroSlider(
                showSkipBtn: false,
                showNextBtn: false,
                showPrevBtn: false,
                showDoneBtn: false,
                hideStatusBar: true,
                scrollPhysics: const BouncingScrollPhysics(),
                sizeDot: 15,
                slides: slides,
                colorActiveDot: Theme.of(context).colorScheme.background,
                typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
                onTabChangeCompleted: onTabChangeCompleted,
                // refFuncGoToTab: (refFunc) {
                //   goToTab = refFunc;
                // },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Neumorphic(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  ),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      color: Theme.of(context).colorScheme.primary,
                      depth: 15,
                      oppositeShadowLightSource: true,
                    ),
                    padding: EdgeInsets.all(2),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: controller,
                            inputFormatters: [
                              MaskedInputFormatter('#### ######',
                                  allowedCharMatcher: RegExp(r'[0-9]')),
                            ],
                            onChanged: (number) {
                              print(number.length);
                              if (number.length > 10) {
                                submitShow = true;
                              } else {
                                submitShow = false;
                              }
                              setState(() {});
                            },
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                focusColor:
                                    Theme.of(context).colorScheme.background,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 20, right: 3),
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      '+91 ',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                suffixIcon: submitShow
                                    ? IconButton(
                                        iconSize: 40,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPressed: () async {
                                          ref
                                              .read(phoneNumberStateProvider
                                                  .notifier)
                                              .state = '+91' + controller.text;
                                          // context.router
                                          //     .push(OtpCodeVerifyRoute());
                                        },
                                        icon: FaIcon(
                                            FontAwesomeIcons.arrowCircleRight),
                                      )
                                    : null),
                          ),
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class RectPathProvider extends NeumorphicPathProvider {
  const RectPathProvider({Listenable? reclip});

  @override
  bool shouldReclip(NeumorphicPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..moveTo(0, size.height * 0.75)
      ..addRect(
          Rect.fromLTWH(0, size.height / 1.3, size.width, size.height / 4))
      ..close();
  }

  @override
  bool get oneGradientPerPath => false;
}
