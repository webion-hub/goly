import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/cards/action_card.dart';
import 'package:goly/components/cards/description_card.dart';
import 'package:goly/components/dialogs/confirmation_dialog.dart';
import 'package:goly/components/list_tile/goal_list_tile.dart';
import 'package:goly/models/category.dart';
import 'package:goly/pages/main/goals/actions/category/handle_category_page.dart';
import 'package:goly/pages/main/goals/actions/goal/handle_goal_page.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    void goToHandleCategory() {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => HandleCategoryPage(
                category: category,
              )));
    }

    void deleteCategory() {
      showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
          title: 'Are you sure?',
          message:
              'Are you sure you want to delete this category? All goals inside it will be deleted',
          noAction: () {
            Navigator.of(context).pop();
          },
          yesAction: () {
            CategoryService.deleteCategory(categoryId: category.name);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      );
    }

    void goToHandleGoal() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleGoalPage(
          categoryName: category.name,
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: goToHandleCategory,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: deleteCategory,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: Constants.pagePadding,
          child: Column(children: [
            category.description != null
                ? DescriptionCard(text: category.description!)
                : const SizedBox(),
            ...?category.goals?.map((goal) => GoalListTile(goal: goal)),
            ActionCard(
              text: 'Add goal',
              icon: Icons.add,
              action: goToHandleGoal,
            ),
          ]),
        ),
      ),
    );
  }
}
