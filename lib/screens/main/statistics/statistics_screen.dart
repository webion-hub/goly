import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/custom_divider.dart';
import 'package:goly/widgets/statistics/goals_per_life_area.dart';
import 'package:goly/widgets/statistics/life_area_progress.dart';

class StatisticsScreen extends StatelessWidget {
  static const String routeName = '/statistics';
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            GoalsPerLifeAreaPieChart(),
            SizedBox(height: 15),
            CustomDivider(),
            SizedBox(height: 15),
            LifeAreaProgress(),
          ],
        ),
      ),
    );
  }
}
