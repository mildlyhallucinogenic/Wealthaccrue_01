import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:intl/intl.dart';

class PortfolioGraphScreen extends StatelessWidget {
  var dates = [
    'Jan/21',
    'Feb/21',
    'Mar/21',
    'Apr/21',
    'May/21',
    'Jun/21',
    'Jul/21',
    'Aug/21',
    'Sep/21',
    'Oct/21',
    'Nov/21',
    'Dec/21',
  ];

  var amounts = [
    697565.20,
    813064.00,
    783219.61,
    972106.64,
    1065431.36,
    1246822.72,
    1256410.59,
    1197877.66,
    1252338.43,
    1180142.29,
    1144921.67,
    1124065.89
  ];

  var portfolioAmounts = [];

  PortfolioGraphScreen({Key? key}) {
    portfolioAmounts = zip([dates, amounts]).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(portfolioAmounts[0][0], portfolioAmounts[0][1]),
      ChartData(portfolioAmounts[1][0], portfolioAmounts[1][1]),
      ChartData(portfolioAmounts[2][0], portfolioAmounts[2][1]),
      ChartData(portfolioAmounts[3][0], portfolioAmounts[3][1]),
      ChartData(portfolioAmounts[4][0], portfolioAmounts[4][1]),
      ChartData(portfolioAmounts[5][0], portfolioAmounts[5][1]),
      ChartData(portfolioAmounts[6][0], portfolioAmounts[6][1]),
      ChartData(portfolioAmounts[7][0], portfolioAmounts[7][1]),
      ChartData(portfolioAmounts[8][0], portfolioAmounts[8][1]),
      ChartData(portfolioAmounts[9][0], portfolioAmounts[9][1]),
      ChartData(portfolioAmounts[10][0], portfolioAmounts[10][1]),
      ChartData(portfolioAmounts[11][0], portfolioAmounts[11][1]),
    ];

    // final List<ChartData> chartData = <ChartData>[
    //   ChartData(2010, 10.53),
    //   ChartData(2011, 9.5),
    //   ChartData(2012, 10),
    //   ChartData(2013, 9.4),
    //   ChartData(2014, 5.8),
    //   ChartData(2015, 4.9),
    //   ChartData(2016, 4.5),
    //   ChartData(2017, 3.6),
    //   ChartData(2018, 3.43),
    // ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 3),
                  // minorTicksPerInterval: 6,
                ),
                primaryYAxis: NumericAxis(
                  //Hide the gridlines of y-axis
                  majorGridLines: MajorGridLines(width: 0),
                  rangePadding: ChartRangePadding.round,
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
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}
