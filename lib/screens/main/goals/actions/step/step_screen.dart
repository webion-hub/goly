import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/widgets/cards/action_card.dart';
import 'package:goly/widgets/cards/description_card.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/mark_as_completed_list_tile.dart';
import 'package:goly/widgets/list_tile/step_list_tile.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';

class StepScreen extends StatelessWidget {
  static const routeName = '/single-goal';
  final int stepId;
  final int goalId;
  final String categoryId;
  const StepScreen({super.key, required this.categoryId, required this.goalId, required this.stepId});

  @override
  Widget build(BuildContext context) {
    void goToHandleStep(GoalModel goal) {      
      //GoRouter.of(context).push(HandleStepScree.routeNameEdit, extra: {'categoryId': categoryId, 'goal': goal});
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
            await GoalService.deleteGoal(
                categoryId: categoryId, goalId: goalId);
          },
        ),
      );
    }

    return StreamBuilder (
      stream: GoalService.getGoalStreamFromId(categoryId: categoryId, goalId: goalId),
      builder: (context, snapshot) {
        if(snapshot.data == null || snapshot.data!.data() == null) {
          return const Text('Error');
        }
        GoalModel g = GoalModel.fromJson(snapshot.data!.data()!);
        return Scaffold(
          appBar: AppBar(
            title: Text(g.name),
            actions: [
              IconButton(
                onPressed: () => goToHandleStep(g),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () => deleteGoal(goalId),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: Constants.pagePadding,
              child: Column(children: [
                g.description != null
                    ? DescriptionCard(text: g.description!)
                    : const SizedBox(),
                g.steps!.isEmpty ? MarkAsCompletedListTile(categoryId: categoryId, goalId: goalId,) : const SizedBox(),
                
                ...?g.steps?.map((step) => StepListTile(step: step)),
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
    );
  }
}
