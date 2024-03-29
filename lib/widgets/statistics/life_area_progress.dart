import 'package:flutter/material.dart';
import 'package:goly/models/statistics.dart';
import 'package:goly/services/statistic_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LifeAreaProgress extends StatefulWidget {
  const LifeAreaProgress({super.key});

  @override
  State<LifeAreaProgress> createState() => _LifeAreaProgressState();
}

class _LifeAreaProgressState extends State<LifeAreaProgress> {
  late TooltipBehavior _tooltipBehavior;
  List<GoalsPerLifeAreaModel> categoriesData = [];
  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            StatisticService.getLifeAreaProgress(), //new feature to implement
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buffering();
          }
          List<LifeAreaProgressModel> data = (snapshot.data as List<LifeAreaProgressModel>);
          return SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.width + 100,
              width: MediaQuery.of(context).size.width,
              child: SfCircularChart(
                title: ChartTitle(text: "Category progress"),
                legend: Legend(
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.vertical,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  RadialBarSeries<LifeAreaProgressModel, String>(
                    maximumValue: 100,
                    cornerStyle: CornerStyle.bothCurve,
                    dataSource: data,
                    xValueMapper: (LifeAreaProgressModel data, _) =>
                        data.category,
                    yValueMapper: (LifeAreaProgressModel data, _) =>
                        data.percentageOfCompletition,
                    dataLabelSettings: const DataLabelSettings(
                      showCumulativeValues: true,
                      useSeriesColor: true,
                      isVisible: false,
                    ),
                    useSeriesColor: true,
                    trackOpacity: 0.3,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
