import 'package:charts_flutter/flutter.dart' as charts;

class ChartModel {
  final String month;
  final int number;
  final charts.Color barColor;

  ChartModel(
      {required this.month, required this.number, required this.barColor});
}
