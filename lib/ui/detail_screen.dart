import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_tracking_covid/constant/color.dart';
import 'package:flutter_tracking_covid/constant/sizes.dart';
import 'package:flutter_tracking_covid/widget/donut_chart.dart';

import 'base_widget.dart';

class DetailScreen extends StatefulWidget {
  final title, cases, active, recovered, deaths;

  DetailScreen(
      this.title, this.cases, this.active, this.recovered, this.deaths);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int cases, deaths, recovered, confirmed;

  @override
  initState(){
    super.initState();
    cases = int.parse(widget.cases);
    deaths = int.parse(widget.deaths);
    recovered = int.parse(widget.recovered);
    confirmed = int.parse(widget.active);
  }

  List<charts.Series<DataChart, int>> _createDataChart() {
    final data = [
      new DataChart(0, recovered,
          AppColor.colorRecoveredCases),
      new DataChart(1, deaths,
          AppColor.colorDeathCases),
      new DataChart(2, confirmed,
          AppColor.colorConfirmedCases),
    ];

    return [
      new charts.Series<DataChart, int>(
        id: 'country',
        domainFn: (DataChart data, _) => data.index,
        measureFn: (DataChart data, _) => data.value,
        colorFn: (DataChart data, _) => DonutPieChart.getChartColor(data.color),
        data: data,
      )
    ];
  }

  _calculateStrPercent(int value) {
    var percent = (value / cases) * 100.0;
    return percent.toStringAsFixed(2) + "%";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[600], //change your color here
        ),
        title: Text(widget.title, style: TextStyle(color: Colors.grey[600]),),
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimens["x_large"],
              vertical: Sizes.dimens["large"]),
          child: ListView(
            children: <Widget>[
              _buildTitle(),
              SizedBox(height: 20,),
              _buildChartInfo(),
              SizedBox(height: 30,),
              _buildContentInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() => Align(
      alignment: Alignment.center,
      child: Text(
        "Covid 19 Reports",
        style: TextStyle(
            fontSize: Sizes.text_sizes["x_large"], fontWeight: FontWeight.w500),
      ));

  Widget _drawChart() => Container(
        width: 200,
        height: 200,
        child: DonutPieChart(
          _createDataChart(),
          animate: true,
        ),
      );

  Widget _buildChartInfo() => Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: BaseWidget(
                builder: (_, sizingInfo) {
                  return Container(
                    width: sizingInfo.localWidgetSize.width,
                    height: sizingInfo.localWidgetSize.width,
                    child: _drawChart(),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: Sizes.dimens["x_large"],
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                _buildWidgetPerchent(
                    "Confirmed",
                    _calculateStrPercent(
                        confirmed.toInt()),
                    AppColor.colorConfirmedCases),
                SizedBox(
                  height: Sizes.dimens["tiny"],
                ),
                _buildWidgetPerchent(
                    "Recovered",
                    _calculateStrPercent(
                        recovered.toInt()),
                    AppColor.colorRecoveredCases),
                SizedBox(
                  height: Sizes.dimens["tiny"],
                ),
                _buildWidgetPerchent(
                    "Death",
                    _calculateStrPercent(
                        deaths.toInt()),
                    AppColor.colorDeathCases)
              ],
            ),
          )
        ],
      );

  Widget _buildWidgetPerchent(String title, String percent, Color color) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: Sizes.dimens["tiny"]),
            width: Sizes.dimens["xx_large"],
            height: Sizes.dimens["small"],
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          SizedBox(
            width: Sizes.dimens["tiny"],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              Text(
                percent,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      );

  Widget _buildContentInfo() => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildRectangleInfo("Receovered",
                  recovered.toInt(),
                  color: AppColor.colorRecoveredCases),
              SizedBox(
                width: Sizes.dimens["xx_large"],
              ),
              _buildRectangleInfo(
                  "Affected", confirmed.toInt(),
                  color: AppColor.colorConfirmedCases),
            ],
          ),
          SizedBox(
            height: Sizes.dimens["xx_large"],
          ),
          Row(
            children: <Widget>[
              _buildRectangleInfo(
                  "Deaths", deaths.toInt(),
                  color: AppColor.colorDeathCases),
              SizedBox(
                width: Sizes.dimens["xx_large"],
              ),
              _buildRectangleInfo(
                  "Total Cases", cases.toInt()),
            ],
          )
        ],
      );

  Widget _buildRectangleInfo(String title, int value, {Color color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimens["large"],
            vertical: Sizes.dimens["x_large"]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                color == null
                    ? Container(
                        color: Colors.red,
                      )
                    : Container(
                        margin: EdgeInsets.only(right: Sizes.dimens["small"]),
                        width: Sizes.dimens["x_small"],
                        height: Sizes.dimens["x_small"],
                        color: color,
                      ),
                Text(
                  title,
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
            SizedBox(
              height: Sizes.dimens["large"],
            ),
            Text(
              value.toString(),
              style: TextStyle(
                  fontSize: Sizes.text_sizes["xx_large"],
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.dimens["tiny"])),
            border: Border.all(color: Colors.grey[400])),
      ),
    );
  }
}
