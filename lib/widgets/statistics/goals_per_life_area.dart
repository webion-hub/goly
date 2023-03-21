import 'package:flutter/material.dart';
import 'package:goly/models/statistics.dart';
import 'package:goly/services/statistic_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalsPerLifeAreaPieChart extends StatefulWidget {
  const GoalsPerLifeAreaPieChart({super.key});

  @override
  State<GoalsPerLifeAreaPieChart> createState() =>
      _GoalsPerLifeAreaPieChartState();
}

class _GoalsPerLifeAreaPieChartState extends State<GoalsPerLifeAreaPieChart> {
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
        future: StatisticService.getGoalsPerLifeArea(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return buffering();
          }
          List<GoalsPerLifeAreaModel> data =
              (snapshot.data as List<GoalsPerLifeAreaModel>);
          return SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.width + 100,
              width: MediaQuery.of(context).size.width,
              child: SfCircularChart(
                title: ChartTitle(text: "Number of goals per category"),
                legend: Legend(
                  position: LegendPosition.bottom,
                  orientation: LegendItemOrientation.vertical,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  PieSeries<GoalsPerLifeAreaModel, String>(
                    dataSource: data,
                    xValueMapper: (GoalsPerLifeAreaModel data, _) =>
                        data.category,
                    yValueMapper: (GoalsPerLifeAreaModel data, _) =>
                        data.goalsNumber,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
