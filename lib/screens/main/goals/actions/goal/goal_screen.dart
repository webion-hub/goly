import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/goals/actions/step/handle_step_screen.dart';
import 'package:goly/widgets/cards/action_card.dart';
import 'package:goly/widgets/cards/description_card.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/widgets/list_tile/goals/mark_as_completed_list_tile.dart';
import 'package:goly/widgets/list_tile/goals/step_list_tile.dart';

class GoalScreen extends StatelessWidget {
  static const routeName = '/single-goal';
  final int goalId;
  final String categoryId;
  const GoalScreen({super.key, required this.categoryId, required this.goalId});

  @override
  Widget build(BuildContext context) {
    void goToHandleGoal(GoalModel goal) {
      GoRouter.of(context).push(HandleGoalScreen.routeNameEdit,
          extra: {'categoryId': categoryId, 'goal': goal});
    }

    void deleteGoal(int goalId) {
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
            await GoalService.deleteGoal(categoryId: categoryId, goalId: goalId)
                .then((value) => GoRouter.of(context).pop());
          },
        ),
      );
    }

    void goToHandleStep() async {
      GoRouter.of(context).push(HandleStepScreen.routeNameAdd,
          extra: {'categoryId': categoryId, 'goalId': goalId});
    }

    return StreamBuilder(
        stream: GoalService.getGoalStreamFromId(
            categoryId: categoryId, goalId: goalId),
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data!.data() == null) {
            return const Text('Error');
          }
          GoalModel g = GoalModel.fromJson(snapshot.data!.data()!);
          return Scaffold(
            appBar: AppBar(
              title: Text(g.name),
              actions: [
                IconButton(
                  onPressed: () => goToHandleGoal(g),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => deleteGoal(goalId),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: Constants.pagePadding,
              child: Column(
                children: [
                  g.description != null
                      ? DescriptionCard(text: g.description!)
                      : const SizedBox(),
                  g.steps!.isEmpty
                      ? MarkAsCompletedListTile(
                          categoryId: categoryId,
                          goal: g,
                        )
                      : const SizedBox(),
                  ...?g.steps?.map((step) => StepListTile(
                      step: step, categoryId: categoryId, goalId: goalId)),
                  ActionCard(
                    text: 'Add step',
                    icon: Icons.add,
                    action: goToHandleStep,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
