import 'dart:collection';

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/portfolio.dart';
import 'package:wealthaccrue/providers/auth_provider.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class HoldingsPage extends ConsumerStatefulWidget {
  const HoldingsPage({Key? key}) : super(key: key);

  @override
  _HoldingsPageState createState() => _HoldingsPageState();
}

class _HoldingsPageState extends ConsumerState<HoldingsPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // final holdings = ref.watch(holdingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Holdings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 6,
          ),
          Expanded(
            flex: 1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              shadowColor: Theme.of(context).colorScheme.shadow,
              elevation: 100,
              color: Theme.of(context).colorScheme.background,
              child: FirestoreBuilder<PortfolioDocumentSnapshot>(
                  ref:
                      portfoliosRef.doc(FirebaseAuth.instance.currentUser!.uid),
                  builder: (context,
                      AsyncSnapshot<PortfolioDocumentSnapshot> snapshot,
                      Widget? child) {
                    if (snapshot.hasError)
                      return Center(child: Text('Something went wrong!'));
                    if (!snapshot.hasData)
                      return Center(
                          child: SpinKitRipple(
                        color: Theme.of(context).colorScheme.primary,
                        size: 100,
                      ));
                    PortfolioDocumentSnapshot documentSnapshot =
                        snapshot.requireData;

                    if (!documentSnapshot.exists) {
                      return Center(
                          child: Text('User does not have any holdings yet.'));
                    }

                    Portfolio portfolio = documentSnapshot.data!;
                    List<ChartData> chartData = [];
                    SplayTreeMap.from(portfolio.values!).forEach(
                      (key, value) {
                        chartData.add(ChartData(
                            DateFormat('yMMMd')
                                .format(DateTime.parse(key))
                                .toString(),
                            double.parse(value)));
                      },
                    );
                    return Center(
                      child: SizedBox(
                          width: 500,
                          height: 300,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                  axisLine: AxisLine(width: 3),
                                  labelRotation: 330
                                  // minorTicksPerInterval: 6,
                                  ),
                              primaryYAxis: NumericAxis(
                                //Hide the gridlines of y-axis
                                majorGridLines: MajorGridLines(width: 0),
                                rangePadding: ChartRangePadding.normal,
                                //Hide the axis line of y-axis
                                axisLine: AxisLine(width: 3),

                                // minorTicksPerInterval: 6,
                              ),
                              series: <ChartSeries>[
                                SplineSeries<ChartData, String>(
                                  color: Colors.amber,
                                  dataSource: chartData,
                                  animationDuration: 1000,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  name: 'Portfolio',
                                  cardinalSplineTension: 10.0,
                                  width: 3,
                                  markerSettings: const MarkerSettings(
                                    width: 6,
                                    height: 6,
                                    isVisible: true,
                                    shape: DataMarkerType.none,
                                  ),
                                ),
                              ])),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
            flex: 1,
            child: FirestoreBuilder<DataDocumentSnapshot>(
                ref: holdingsRef.doc(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, AsyncSnapshot<DataDocumentSnapshot> snapshot,
                    Widget? child) {
                  if (snapshot.hasError)
                    return Center(child: Text('Something went wrong!'));
                  if (!snapshot.hasData)
                    return Center(
                        child: SpinKitRipple(
                      color: Theme.of(context).colorScheme.primary,
                      size: 100,
                    ));
                  DataDocumentSnapshot documentSnapshot = snapshot.requireData;

                  if (!documentSnapshot.exists) {
                    return Center(
                        child: Text('User does not have any holdings yet.'));
                  }

                  Data holdings = documentSnapshot.data!;

                  return ListView.builder(
                      itemCount: 7,
                      // itemcount: holdings.smallcases.public
                      //     .where((element) => element.stats.currentValue > 0)
                      //     .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                            height: height * 0.15,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(6)),
                                  intensity: 0.0,
                                  depth: 8,
                                  lightSource: LightSource.topLeft,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        holdings.smallcases.public
                                            .where((element) =>
                                                element.stats.currentValue > 0)
                                            .toList()[index]
                                            .name
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                fontSize: 24,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                fontWeight: FontWeight.bold)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Up " +
                                              holdings.smallcases.public
                                                  .where((element) =>
                                                      element
                                                          .stats.currentValue >
                                                      0)
                                                  .toList()[index]
                                                  .stats
                                                  .totalReturns
                                                  .toStringAsFixed(2),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                        ),
                                        Text(
                                          "₹ " +
                                              holdings.smallcases.public
                                                  .where((element) =>
                                                      element
                                                          .stats.currentValue >
                                                      0)
                                                  .toList()[index]
                                                  .stats
                                                  .currentValue
                                                  .toStringAsFixed(2),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
