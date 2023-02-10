import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/cards/goal_card.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/pages/main/goals/handle_category_page.dart';
import 'package:goly/utils/constants.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    GoalModel g = GoalModel(
        id: "1",
        private: true,
        privateDescription: true,
        title: "This is a test",
        completed: false,
        description: "This is a test description");
    void goToHandleCategory() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleCategoryPage(
          category: category,
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
              onPressed: goToHandleCategory, icon: const Icon(Icons.edit))
        ],
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
