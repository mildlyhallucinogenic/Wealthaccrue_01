import 'package:flutter/material.dart';
import '../models/mutual_fund_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FundPerformanceScreen extends StatelessWidget {
  FundPerformanceScreen({Key? key, required this.chartData}) : super(key: key);

  List<Dates> chartData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
          child: Container(
              child: SfCartesianChart(series: <ChartSeries>[
        SplineAreaSeries<Dates, String>(
          dataSource: chartData,
          splineType: SplineType.cardinal,
          cardinalSplineTension: 0.9,
          xValueMapper: (Dates data, _) => data.date,
          yValueMapper: (Dates data, _) => double.parse(data.nav),
        )
      ]))),
    );
  }
}
