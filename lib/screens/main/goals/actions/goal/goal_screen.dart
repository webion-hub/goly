import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/cards/action_card.dart';
import 'package:goly/widgets/cards/description_card.dart';
import 'package:goly/widgets/dialogs/confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/mark_as_completed_list_tile.dart';
import 'package:goly/widgets/list_tile/step_list_tile.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';

class GoalScreen extends StatelessWidget {
  static const routeName = '/single-goal';
  final GoalModel goal;
  final String categoryName;
  const GoalScreen({super.key, required this.categoryName, required this.goal});

  @override
  Widget build(BuildContext context) {
    void goToHandleCategory() {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => HandleGoalScreen(
            goal: goal,
            categoryId: categoryName,
          ),
        ),
      );
    }

    void deleteCategory() {
      showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
          title: 'Are you sure?',
          message:
              'Are you sure you want to delete this goal? All goals steps it will be deleted',
          noAction: () {
            Navigator.of(context).pop();
          },
          yesAction: () {
            GoalService.deleteGoal(categoryName: categoryName, goal: goal);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      );
    }

    void goToHandleStep() async {

        GoalService.addStepToGoal(
            goal: goal, step: StepModel(name: "stepTest"));
        //StepService.addStep(categoryName: categoryName, goalIndex: 1, step: StepModel(name: "stepTest"));


      // Navigator.of(context).push(CupertinoPageRoute(
      //   builder: (context) => HandleGoalScreen(
      //     categoryName: categoryName,
      //   ),
      // ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(goal.name),
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
            const MarkAsCompletedListTile(),
            ...?goal.steps?.map((step) => StepListTile(step: step)),
            ActionCard(
              text: 'Add step',
              icon: Icons.add,
              action: goToHandleStep,
            ),
          ]),
        ),
      ),
    );
  }
}
