import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'chart_model.dart';

class ChartData extends StatelessWidget {
  final List<ChartModel> data;
  ChartData({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartModel, String>> series = [
      charts.Series(
          id: "recycles",
          data: data,
          domainFn: (ChartModel series, _) => series.month,
          measureFn: (ChartModel series, _) => series.number,
          colorFn: (ChartModel series, _) => series.barColor)
    ];

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Recycling Progress',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        Expanded(
          flex: 9,
          child: SizedBox(
            width: double.infinity,
            child: charts.BarChart(
              series,
              animate: true,
            ),
          ),
        )
      ],
    );
  }
}
