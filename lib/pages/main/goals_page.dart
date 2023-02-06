import 'package:flutter/material.dart';
import 'package:goly/components/cards/category_card.dart';
import 'package:goly/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _MainPageState();
}

class _MainPageState extends State<GoalsPage> {
  late List<CategoryData> _chartData;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: Constants.pagePadding,
      child: Column(
        children: [
          const Text('Life areas'),
          const CategoryCard(title: "Work"),
          const CategoryCard(title: "Personal development"),
          const CategoryCard(title: "Finance"),
          const SizedBox(
            height: 40,
          ),
          const Text('Statistics'),
          SafeArea(
            child: SfCircularChart(
              title: ChartTitle(text: "Number of goals per life area"),
              legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              series: <CircularSeries>[
                PieSeries<CategoryData, String>(
                  dataSource: _chartData,
                  xValueMapper: (CategoryData data, _) => data.category,
                  yValueMapper: (CategoryData data, _) => data.goalsNumber,
                  dataLabelSettings: DataLabelSettings(isVisible: true, ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
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
