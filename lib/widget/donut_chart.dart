import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_tracking_covid/constant/color.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 55, strokeWidthPx: 0, startAngle: -45),);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<DataChart, int>> _createSampleData() {
    final data = [
      new DataChart(0, 100, AppColor.colorRecoveredCases),
      new DataChart(1, 75, AppColor.colorDeathCases),
      new DataChart(2, 50, AppColor.colorConfirmedCases),
    ];

    return [
      new charts.Series<DataChart, int>(
        id: 'sales',
        domainFn: (DataChart sales, _) => sales.index,
        measureFn: (DataChart sales, _) => sales.value,
        data: data,
      )
    ];
  }

  static charts.Color getChartColor(Color color) {
    return charts.Color(
        r: color.red,
        g: color.green,
        b: color.blue,
        a: color.alpha);
  }
}

class DataChart {
  final int index;
  final int value;
  final Color color;

  DataChart(this.index, this.value, this.color);
}