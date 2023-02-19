import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

//TODO: Add streambuilder

class GoalScreen extends StatelessWidget {
  static const routeName = '/single-goal';
  final GoalModel goal;
  final String categoryId;
  const GoalScreen({super.key, required this.categoryId, required this.goal});

  @override
  Widget build(BuildContext context) {
    void goToHandleGoal() {      
      GoRouter.of(context).push(HandleGoalScreen.routeNameEdit, extra: {'categoryId': categoryId, 'goal': goal});
    }

    void deleteGoal() {
      showDialog(
        context: context,
        builder: (context) => AsyncConfirmationDialog(
          title: 'Are you sure?',
          message:
              'Are you sure you want to delete this goal? All goals steps it will be deleted',
          noAction: () {
            Navigator.of(context).pop();
          },
          yesAction: () async {
            Navigator.of(context).pop();
            await GoalService.deleteGoal(
                categoryId: categoryId, goal: goal);
          },
        ),
      );
    }

    void goToHandleStep() async {
      GoalService.addStepToGoal(goal: goal, step: StepModel(name: "stepTest"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(goal.name),
        actions: [
          IconButton(
            onPressed: goToHandleGoal,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: deleteGoal,
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
