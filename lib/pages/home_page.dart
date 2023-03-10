import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wealthaccrue/main.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/portfolio.dart';
import 'package:wealthaccrue/providers/auth_provider.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import 'package:wealthaccrue/pages/settings.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';
import '../apis/smallcase_gateway.dart';
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  double _getSum(List<Public> public) {
    double s = 0;
    public
        .where((element) => element.stats.currentValue > 0)
        .forEach((element) {
      s += element.stats.currentValue;
    });
    return s;
  }

  Future<void> updateInvestorHoldings(Data holdings) async {
    await holdingsRef.doc(FirebaseAuth.instance.currentUser!.uid).set(holdings);
  }

  Future<void> updateInvestorPortfolio(Data holdings) async {
    await portfoliosRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((document) async {
      if (document.exists == false) {
        await portfoliosRef.doc(FirebaseAuth.instance.currentUser!.uid).set(
                Portfolio(values: {
              Date.today().toString():
                  _getSum(holdings.smallcases.public).toStringAsFixed(2)
            }));
      } else {
        var portfolio = document.data!;
        if (portfolio.values!.containsKey(Date.today().toString()) == false) {
          document.data!.values!.addAll({
            Date.today().toString():
                _getSum(holdings.smallcases.public).toStringAsFixed(2)
          });
        }
        portfoliosRef
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(document.data!);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScgatewayFlutterPlugin.setConfigEnvironment(
        GatewayEnvironment.PRODUCTION, 'wealthaccrue', true, ['kite'] );
    ScgatewayFlutterPlugin.initGateway(
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJndWVzdCI6dHJ1ZSwiaWF0IjoxNjU0MzIxMDAwfQ.wealthaccrue_82ff3a1f85bf4ee987d3de4dfe0b27b3-lMEHZU");
    ScgatewayFlutterPlugin.getAllSmallcases();

    // analytics!.logAppOpen();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // final holdings = ref.watch(holdingsDataProvider);
    // holdings.whenData((value) => updateInvestorHoldings(value.data));
    // holdings.whenData((value) => updateInvestorPortfolio(value.data));

    var tween = TimelineTween<AniProps>()
          ..addScene(
                  begin: Duration.zero, end: const Duration(milliseconds: 800))
              .animate(AniProps.opacity,
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut)
              .animate(AniProps.height,
                  tween: Tween<double>(begin: 0, end: height * 0.08),
                  curve: Curves.easeOutBack)
        // .animate(AniProps.opacity, tween: Tween<double>(begin: 0.0, end: 1.0))
        ;

    return Scaffold(
      appBar: AppBar(title: Text("Portfolio"), centerTitle: true, actions: [
        IconButton(
          icon: Icon(
            Icons.account_circle,
          ),
          onPressed: () => context.router.push(SettingsRoute()),
        ),
      ]),
      body: 
      // holdings.when(
      //     loading: () => Shimmer.fromColors(
      //           direction: ShimmerDirection.ltr,
      //           baseColor: Theme.of(context).colorScheme.secondaryContainer,
      //           highlightColor: Colors.white70,
      //           child: Center(
      //             child: Container(
      //               width: width * 0.9,
      //               height: height * 0.7,
      //               decoration: BoxDecoration(
      //                 color: Theme.of(context).colorScheme.secondaryContainer,
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //             ),
      //           ),
      //         ),
      //     error: (err, stack) => Center(child: Text('Error: $err')),
      //     data: (holdings) {
      //       return 
      Center(
              child: Container(
                width: width * 0.9,
                height: height * 0.7,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Net Value: ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "₹ " + ''
                              // _getSum(holdings.data.smallcases.public)
                                  // .toStringAsFixed(2)
                                  ,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  PlayAnimation<TimelineValue<AniProps>>(
                      tween: tween, // provide tween
                      duration: tween
                          .duration, // total duration obtained from TimelineTween
                      builder: (context, child, value) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          // width: value
                          //     .get(AniProps.width), // get animated width value
                          height: value.get(AniProps.height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Opacity(
                            opacity: value.get(AniProps.opacity),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  fixedSize: Size(width * 0.7, height * 0.08)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cases",
                                      style: TextStyle(fontSize: 27),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 24,
                                    )
                                  ]),
                              onPressed: () =>
                                  context.router.navigate(CasesRouter()),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  PlayAnimation<TimelineValue<AniProps>>(
                      tween: tween, // provide tween
                      duration: tween
                          .duration, // total duration obtained from TimelineTween
                      builder: (context, child, value) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          // width: value
                          //     .get(AniProps.width), // get animated width value
                          height: value.get(AniProps.height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Opacity(
                            opacity: value.get(AniProps.opacity),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  fixedSize: Size(width * 0.7, height * 0.08)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Compare",
                                      style: TextStyle(fontSize: 27),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 24,
                                    )
                                  ]),
                              onPressed: () =>
                                  context.router.navigate(CompareRouter()),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  PlayAnimation<TimelineValue<AniProps>>(
                      tween: tween, // provide tween
                      duration: tween
                          .duration, // total duration obtained from TimelineTween
                      builder: (context, child, value) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          // width: value
                          //     .get(AniProps.width), // get animated width value
                          height: value.get(AniProps.height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Opacity(
                            opacity: value.get(AniProps.opacity),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  fixedSize: Size(width * 0.7, height * 0.08)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Holdings",
                                      style: TextStyle(fontSize: 27),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 24,
                                    )
                                  ]),
                              onPressed: () =>
                                  context.router.push(HoldingsRoute()),
                            ),
                          ),
                        );
                      })
                ]),
              ),
            ));
          }
          // ),
    // );
  }
// }

enum AniProps { width, height, color, opacity }
