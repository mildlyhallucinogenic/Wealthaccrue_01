import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wealthaccrue/models/returns_model.dart';
import 'package:wealthaccrue/models/smallcase_model.dart';
import 'package:wealthaccrue/pages/case_compare.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class CaseDetailsPage extends ConsumerStatefulWidget {
  const CaseDetailsPage({Key? key}) : super(key: key);
  @override
  ConsumerState<CaseDetailsPage> createState() => _CaseDetailsPageState();
}

class _CaseDetailsPageState extends ConsumerState<CaseDetailsPage> {
  @override
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

  Widget build(BuildContext context) {
    final smallcase = ref.read(smallcaseProvider);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final smallcases = ref.watch(smallcaseListProvider);
    final returnsMap = ref.watch(smallcaseReturnsProvider);
    String caseDuration = '1y';
    List<String> durations = [];
    int _selectedIndex = 0;

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
                    appBar: AppBar(),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                      //           // width: width * 0.2,
                      //           // height: height * 0.1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.softLight),
                                    child: Image.asset(
                                      'images/smallcase-logo.png',
                                      width: width * 0.25,
                                      height: height * 0.125,
                                      // CachedNetworkImageProvider(
                                      //     smallcase.info['imageUrl']!),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(smallcase!.info!.name.toString(),
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 39,
                                              fontWeight: FontWeight.normal,
                                            )),
                                    SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.amber,
                              ),
                              FaIcon(
                                FontAwesomeIcons.star,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    (smallcase.stats!.ratios!.cagrDuration! +
                                        ' CAGR'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  (smallcase.stats!.ratios!.cagr! * 100)
                                          .toStringAsFixed(2)
                                          .replaceAll('-', '') +
                                      '%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: (smallcase.stats!.ratios!.cagr! *
                                                    100 >
                                                0)
                                            ? Colors.green[500]
                                            : Colors.red[600],
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 8),
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: ListView(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        smallcase.info!.shortDescription
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Expert Analysis",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Generic Review",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Returns",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SfCartesianChart(
                                        tooltipBehavior: TooltipBehavior(
                                            enable: true,
                                            activationMode:
                                                ActivationMode.singleTap,
                                            shared: true,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            canShowMarker: true,
                                            shadowColor: Theme.of(context)
                                                .colorScheme
                                                .shadow,
                                            tooltipPosition:
                                                TooltipPosition.auto),
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                MajorGridLines(width: 0),
                                            axisLine: AxisLine(width: 3),
                                            labelRotation: 330,
                                            rangePadding: ChartRangePadding.auto
                                            // minorTicksPerInterval: 6,
                                            ),
                                        primaryYAxis: NumericAxis(
                                          //Hide the gridlines of y-axis
                                          majorGridLines:
                                              MajorGridLines(width: 0.4),
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
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          offset: Offset(-width * 0.2, 0),
                                          position: LegendPosition.top,
                                          overflowMode:
                                              LegendItemOverflowMode.wrap,
                                          // Legend title
                                        ),
                                        series: <ChartSeries>[
                                          // Renders spline chart
                                          LineSeries<ChartData, String>(
                                            dataSource: getData(
                                                returnsMap[smallcase.scid]![
                                                        caseDuration]!
                                                    .data
                                                    .smallcase
                                                    .points),
                                            enableTooltip: true,
                                            xValueMapper: (ChartData data, _) =>
                                                data.x,
                                            yValueMapper: (ChartData data, _) =>
                                                data.y,
                                            legendItemText: toAcronym(
                                              smallcase.info!.name!.split(' '),
                                            ),
                                            name: toAcronym(
                                              smallcase.info!.name!.split(' '),
                                            ),
                                          ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              // decoration: BoxDecoration(
                                              //   borderRadius: BorderRadius.circular(10),
                                              // ),
                                              width:
                                                  width * 0.15 * durations.length,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: durations.length,
                                                  itemBuilder: ((context, index) {
                                                    return Container(
                                                      color: (_selectedIndex !=
                                                              index)
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .secondaryContainer
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .tertiaryContainer,
                                                      width: width * 0.15,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            _selectedIndex =
                                                                index;
                                                            caseDuration =
                                                                durations[index];
                                                            setState(() {});
                                                          },
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: (_selectedIndex !=
                                                                    index)
                                                                ? Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary
                                                                : Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .tertiary,
                                                          ),
                                                          child: Text(durations[
                                                                  index]
                                                              .toUpperCase())),
                                                    );
                                                  })),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          )

                      //     // Center(child: Text(smallcase!.info!.name.toString())),
                        ],
                      ),
                    )
                    );
              });
        });
  }
}
