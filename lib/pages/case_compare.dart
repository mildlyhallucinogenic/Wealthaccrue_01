import 'package:drop_shadow/drop_shadow.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wealthaccrue/models/smallcase_model.dart' hide Returns;
import 'package:wealthaccrue/models/returns_model.dart' hide Smallcase;
import 'package:wealthaccrue/providers/global_providers.dart';
import '../providers/db_provider.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CaseComparePage extends ConsumerStatefulWidget {
  const CaseComparePage({Key? key}) : super(key: key);

  @override
  _CaseComparePageState createState() => _CaseComparePageState();
}

class _CaseComparePageState extends ConsumerState<CaseComparePage> {
  Smallcase? firstCase, secondCase;
  TextEditingController firstCaseController = TextEditingController();
  TextEditingController secondCaseController = TextEditingController();
  bool startComparison = false;
  final _controller = ScrollController();
  String caseDuration = '1y';
  List<String> durations = [];
  int _selectedIndex = 0;

  List<ChartData> getData(List<Point> points) {
    var l = <ChartData>[];
    points.forEach((point) {
      l.add(ChartData(
          DateFormat('yMMMd').format(point.date).toString(), point.value));
    });
    return l;
  }

  String toAcronym(List<String> words) {
    String name = '';
    words.forEach((word) {
      name += word[0].toUpperCase();
    });
    return name;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final smallcases = ref.watch(smallcaseListProvider);
    final returnsMap = ref.watch(smallcaseReturnsProvider);

    // print(returnsMap.hasValue);
    final loader = SpinKitRipple(
      color: Theme.of(context).colorScheme.primary,
      size: 100.0,
    );

    return smallcases.when(
        error: (err, stack) => Center(child: loader),
        loading: () => Center(child: loader),
        data: (smallcases) {
          return returnsMap.when(
            error: (err, stack) => Center(child: loader),
            loading: () => Center(child: loader),
            data: (returnsMap) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Case Compare'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TypeAheadField<Smallcase>(
                          textFieldConfiguration: TextFieldConfiguration(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  firstCase = null;
                                  startComparison = false;
                                }
                                if (firstCase != null &&
                                    value != firstCase!.info!.name) {
                                  firstCase = null;
                                  startComparison = false;
                                }
                                setState(() {});
                              },
                              controller: firstCaseController,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontStyle: FontStyle.italic),
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: "Smallcase 1")),
                          suggestionsCallback: (pattern) async {
                            return smallcases
                                .where((Smallcase smallcase) => smallcase
                                    .info!.name!
                                    .toLowerCase()
                                    .startsWith(pattern.toLowerCase()))
                                .toList();
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.info!.name!),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            setState(() {});
                            firstCase = suggestion;
                            firstCaseController.text = firstCase!.info!.name!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(child: Text("vs.")),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TypeAheadFormField<Smallcase>(
                          textFieldConfiguration: TextFieldConfiguration(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  secondCase = null;
                                  startComparison = false;
                                }
                                if (secondCase != null &&
                                    value != secondCase!.info!.name) {
                                  secondCase = null;
                                  startComparison = false;
                                }
                                setState(() {});
                              },
                              controller: secondCaseController,
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .copyWith(fontStyle: FontStyle.italic),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Smallcase 2")),
                          suggestionsCallback: (pattern) async {
                            return smallcases
                                .where((Smallcase smallcase) => smallcase
                                    .info!.name!
                                    .toLowerCase()
                                    .startsWith(pattern.toLowerCase()))
                                .toList();
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.info!.name!),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            setState(() {});
                            secondCase = suggestion;
                            secondCaseController.text =
                                secondCase!.info!.name!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        onPressed: (firstCase != null && secondCase != null)
                            ? () {
                                if (firstCase == secondCase) {
                                  startComparison = false;
                                  setState(() {});
                                  showFlash(
                                    duration: Duration(milliseconds: 1500),
                                    context: context,
                                    persistent: false,
                                    builder: (_, controller) {
                                      return Flash(
                                        controller: controller,
                                        horizontalDismissDirection:
                                            HorizontalDismissDirection
                                                .startToEnd,
                                        margin: EdgeInsets.zero,
                                        behavior: FlashBehavior.fixed,
                                        position: FlashPosition.bottom,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        // borderColor: Colors.blue,
                                        boxShadows: kElevationToShadow[8],
                                        backgroundGradient: RadialGradient(
                                          colors: [
                                            Theme.of(context)
                                                .colorScheme
                                                .onError,
                                            Theme.of(context).colorScheme.shadow
                                          ],
                                          center: Alignment.topLeft,
                                          radius: 6,
                                        ),
                                        onTap: () => controller.dismiss(),
                                        // insetAnimationDuration: Duration(milliseconds: 500),
                                        forwardAnimationCurve:
                                            Curves.easeOutBack,
                                        reverseAnimationCurve:
                                            Curves.slowMiddle,
                                        child: DefaultTextStyle(
                                          style: TextStyle(color: Colors.white),
                                          child: FlashBar(
                                            shouldIconPulse: false,
                                            showProgressIndicator: false,
                                            progressIndicatorBackgroundColor:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onError,
                                            title: Text('Cannot Compare'),
                                            content: Text(
                                                'Please select different smallcases.'),
                                            indicatorColor: Theme.of(context)
                                                .colorScheme
                                                .error,
                                            icon: Icon(
                                              Icons.info_outline,
                                              size: 30,
                                            ),
                                            // primaryAction: TextButton(
                                            //   onPressed: () => controller.dismiss(),
                                            //   child: Text('DISMISS'),
                                            // ),
                                            // actions: <Widget>[
                                            //   TextButton(
                                            //       onPressed: () =>
                                            //           controller.dismiss('Yes, I do!'),
                                            //       child: Text('YES')),
                                            //   TextButton(
                                            //       onPressed: () =>
                                            //           controller.dismiss('No, I do not!'),
                                            //       child: Text('NO')),
                                            // ],
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((_) {
                                    if (_ != null) {
                                      // _showMessage(_.toString());
                                    }
                                  });
                                } else {
                                  setState(() {
                                    durations = [];
                                    Set a = Set.of(
                                        returnsMap[firstCase!.scid]!['max']!
                                            .data
                                            .durations);
                                    a = a.intersection(Set.of(
                                        returnsMap[secondCase!.scid]!['max']!
                                            .data
                                            .durations));
                                    durations = List.from(a);
                                    durations.remove("max");
                                    durations = List.from(durations.reversed);

                                    _selectedIndex = durations.indexWhere(
                                        (element) => element == caseDuration);
                                    startComparison = true;
                                    final screenHeight = height * 0.35;
                                    _controller.animateTo(screenHeight,
                                        curve: Curves.ease,
                                        duration: Duration(milliseconds: 540));
                                  });
                                }
                              }
                            : null,
                        child: Text("Compare"),
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(width * 0.65, height * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      if (startComparison) ...[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        IntrinsicHeight(
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  firstCase!.info!.name!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 34,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  secondCase!.info!.name!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 34,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),

                        Container(
                          height: height * 0.45,
                          width: width,
                          // color: Theme.of(context).colorScheme.primaryContainer,
                          child: Column(
                            children: [
                              SfCartesianChart(
                                tooltipBehavior: TooltipBehavior(
                                    enable: true,
                                    activationMode: ActivationMode.singleTap,
                                    shared: true,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    canShowMarker: true,
                                    shadowColor:
                                        Theme.of(context).colorScheme.shadow,
                                    tooltipPosition: TooltipPosition.auto),
                                primaryXAxis: CategoryAxis(
                                    majorGridLines: MajorGridLines(width: 0),
                                    axisLine: AxisLine(width: 3),
                                    labelRotation: 330,
                                    rangePadding: ChartRangePadding.auto
                                    // minorTicksPerInterval: 6,
                                    ),
                                primaryYAxis: NumericAxis(
                                  //Hide the gridlines of y-axis
                                  majorGridLines: MajorGridLines(width: 0.4),
                                  rangePadding: ChartRangePadding.round,
                                  //Hide the axis line of y-axis
                                  axisLine: AxisLine(width: 0),
                                  // minorTicksPerInterval: 6,
                                ),
                                legend: Legend(
                                  borderColor:
                                      Theme.of(context).colorScheme.error,
                                  padding: 0,
                                  // width: "20%",
                                  isVisible: true,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  offset: Offset(-width * 0.2, 0),
                                  position: LegendPosition.top,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  // Legend title
                                ),
                                series: <ChartSeries>[
                                  // Renders spline chart
                                  LineSeries<ChartData, String>(
                                    dataSource: getData(returnsMap[
                                            firstCase!.scid]![caseDuration]!
                                        .data
                                        .smallcase
                                        .points),
                                    enableTooltip: true,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    legendItemText: toAcronym(
                                      firstCase!.info!.name!.split(' '),
                                    ),
                                    name: toAcronym(
                                      firstCase!.info!.name!.split(' '),
                                    ),
                                  ),
                                  LineSeries<ChartData, String>(
                                    dataSource: getData(returnsMap[
                                            secondCase!.scid]![caseDuration]!
                                        .data
                                        .smallcase
                                        .points),
                                    name: toAcronym(
                                      secondCase!.info!.name!.split(' '),
                                    ),
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    legendItemText: toAcronym(
                                      secondCase!.info!.name!.split(' '),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                // alignment: Alignment.center,
                                width: width,
                                height: height * 0.05,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(10),
                                      // ),
                                      width: width * 0.15 * durations.length,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: durations.length,
                                          itemBuilder: ((context, index) {
                                            return Container(
                                              color: (_selectedIndex != index)
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondaryContainer
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer,
                                              width: width * 0.15,
                                              child: TextButton(
                                                  onPressed: () {
                                                    _selectedIndex = index;
                                                    caseDuration =
                                                        durations[index];
                                                    setState(() {});
                                                  },
                                                  style: TextButton.styleFrom(
                                                    primary: (_selectedIndex !=
                                                            index)
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .tertiary,
                                                  ),
                                                  child: Text(durations[index]
                                                      .toUpperCase())),
                                            );
                                          })),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        ///
                        ///
                        ///Start
                        ///
                        ///
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        Text(
                          "Volatility",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  firstCase!.stats!.ratios!.riskLabel!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  secondCase!.stats!.ratios!.riskLabel!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        Text(
                          "Rebalance Schedule",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IntrinsicHeight(
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  toBeginningOfSentenceCase(
                                      firstCase!.info!.rebalanceSchedule!)!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  toBeginningOfSentenceCase(
                                      secondCase!.info!.rebalanceSchedule)!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        Text(
                          "Minimum Investment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IntrinsicHeight(
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "₹ " +
                                      firstCase!.stats!.minInvestAmount
                                          .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  "₹ " +
                                      secondCase!.stats!.minInvestAmount
                                          .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        Text(
                          "Minimum SIP Amount",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IntrinsicHeight(
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "₹ " +
                                      firstCase!.stats!.minSipAmount.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  "₹ " +
                                      secondCase!.stats!.minSipAmount.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    // color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 7.5, left: 20, right: 20),
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        Text(
                          "Description",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IntrinsicHeight(
                          // color: Theme.of(context).colorScheme.tertiary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  firstCase!.info!.shortDescription
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    // color: Theme.of(context).colorScheme.background,
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Expanded(
                                child: Text(
                                  secondCase!.info!.shortDescription
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    // color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 5, bottom: 7.5, left: 20, right: 20),
                        //   child: Divider(
                        //     thickness: 3,
                        //   ),
                        // ),
                        // Text(
                        //   "Volatility",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 28,
                        //     color: Theme.of(context).colorScheme.primary,
                        //   ),
                        // ),
                        // IntrinsicHeight(
                        //   // color: Theme.of(context).colorScheme.tertiary,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Text(
                        //           firstCase!.info!.name!,
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: 22,
                        //             // color: Theme.of(context).colorScheme.background,
                        //           ),
                        //         ),
                        //       ),
                        //       VerticalDivider(
                        //         thickness: 3,
                        //       ),
                        //       Expanded(
                        //         child: Text(
                        //           secondCase!.info!.name!,
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: 22,
                        //             // color: Theme.of(context).colorScheme.primary,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 5, bottom: 7.5, left: 20, right: 20),
                        //   child: Divider(
                        //     thickness: 3,
                        //   ),
                        // ),
                        // Text(
                        //   "Volatility",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 28,
                        //     color: Theme.of(context).colorScheme.primary,
                        //   ),
                        // ),
                        // IntrinsicHeight(
                        //   // color: Theme.of(context).colorScheme.tertiary,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Expanded(
                        //         child: Text(
                        //           firstCase!.info!.name!,
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: 22,
                        //             // color: Theme.of(context).colorScheme.background,
                        //           ),
                        //         ),
                        //       ),
                        //       VerticalDivider(
                        //         thickness: 3,
                        //       ),
                        //       Expanded(
                        //         child: Text(
                        //           secondCase!.info!.name!,
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: 22,
                        //             // color: Theme.of(context).colorScheme.primary,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ]
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
