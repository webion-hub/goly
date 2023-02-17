import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/cards/action_card.dart';
import 'package:goly/components/cards/description_card.dart';
import 'package:goly/components/dialogs/confirmation_dialog.dart';
import 'package:goly/components/list_tile/goal_list_tile.dart';
import 'package:goly/components/list_tile/step_list_tile.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/pages/main/goals/actions/goal/handle_goal_page.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class GoalPage extends StatelessWidget {
  final GoalModel goal;
  final String categoryName;
  const GoalPage({super.key, required this.categoryName, required this.goal});

  @override
  Widget build(BuildContext context) {
    void goToHandleCategory() {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => HandleGoalPage(
                goal: goal,
                categoryName: categoryName,
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
            CategoryService.deleteCategory(categoryId: categoryName);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      );
    }

    void goToHandleGoal() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleGoalPage(
          categoryName: categoryName,
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
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
            goal.description != null
                ? DescriptionCard(text: goal.description!)
                : const SizedBox(),
            ...?goal.steps?.map((step) => StepListTile(step: step)),
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
