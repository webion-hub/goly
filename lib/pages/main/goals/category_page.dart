import 'package:flutter/material.dart';
import 'package:goly/components/cards/goal_card.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/utils/constants.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    GoalModel g = GoalModel(
        id: "1",
        private: true,
        privateDescription: true,
        title: "This is a test",
        completed: false,
        description: "This is a test description");
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Column(children: [
        Center(
          child: Container(
            padding: Constants.pagePadding,
            child: GoalCard(
              goal: g,
            ),
          ),
        ),
      ]),
    );
  }
}
