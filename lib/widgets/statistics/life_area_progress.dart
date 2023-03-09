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
            StatisticService.getGoalsPerLifeArea(), //new feature to implement
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buffering();
          }
          List<LifeAreaProgressModel> data = [
            LifeAreaProgressModel(
                category: 'Life', percentageOfCompletition: 12.2),
            LifeAreaProgressModel(
                category: 'Love', percentageOfCompletition: 15.2),
          ];
          return SafeArea(
            child: SfCircularChart(
              title: ChartTitle(text: "Life area progress"),
              legend: Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                RadialBarSeries<LifeAreaProgressModel, String>(
                  dataSource: data,
                  xValueMapper: (LifeAreaProgressModel data, _) =>
                      data.category,
                  yValueMapper: (LifeAreaProgressModel data, _) =>
                      data.percentageOfCompletition,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                )
              ],
            ),
          );
        });
  }
}
