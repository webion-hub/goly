import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalsPerLifeArea extends StatefulWidget {
  const GoalsPerLifeArea({super.key});

  @override
  State<GoalsPerLifeArea> createState() => _GoalsPerLifeAreaState();
}

class _GoalsPerLifeAreaState extends State<GoalsPerLifeArea> {
  late List<CategoryData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SfCircularChart(
        title: ChartTitle(text: "Number of goals per life area"),
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<CategoryData, String>(
            dataSource: _chartData,
            xValueMapper: (CategoryData data, _) => data.category,
            yValueMapper: (CategoryData data, _) => data.goalsNumber,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
          )
        ],
      ),
    );
  }

  List<CategoryData> getChartData() {
    final List<CategoryData> chartData = [
      CategoryData(category: "Work", goalsNumber: 80.0),
      CategoryData(category: "Personal development", goalsNumber: 80.0),
      CategoryData(category: "Finance", goalsNumber: 80.0),
    ];
    return chartData;
  }
}

class CategoryData {
  CategoryData({required this.category, required this.goalsNumber});
  final String category;
  final double goalsNumber;
}
