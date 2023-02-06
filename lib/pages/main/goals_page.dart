import 'package:flutter/material.dart';
import 'package:goly/components/cards/category_card.dart';
import 'package:goly/utils/constants.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _MainPageState();
}

class _MainPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: Constants.pagePadding,
      child: Column(
        children: [
          const Text('Life areas'),
          CategoryCard(title: "Work"),
          CategoryCard(title: "Personal development"),
          CategoryCard(title: "Finance"),
        ],
      ),
    ));
  }
}
