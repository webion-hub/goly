import 'package:flutter/material.dart';
import 'package:goly/widgets/statistics/goals_per_life_area.dart';
import 'package:goly/widgets/statistics/life_area_progress.dart';

class StatisticScreen extends StatelessWidget {
  static String routeName = '/statistics';
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          GoalsPerLifeAreaPieChart(),
          LifeAreaProgress(),
        ],
      )),
    );
  }
}
