import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/list_tile/goals/no_edit/no_edit_step_list_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalCard extends StatelessWidget {
  final GoalModel goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return goal.privateGoal
        ? const SizedBox()
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(goal.name),
                      onTap: null,
                      leading: FittedBox(
                        child: CircularPercentIndicator(
                          radius: 16.0,
                          lineWidth: 4.0,
                          percent: GoalService.getPercentageOfCompletition(goal),
                          progressColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      subtitle: GoalExpirationDate(
                        goal: goal,
                      ),
                    ),
                    NoEditDescription(goal: goal),
                    const SizedBox(height: 10),
                    GoalReward(goal: goal),
                    GoalCardSteps(goal: goal),
                  ],
                ),
              ),
            ),
          );
  }
}

class GoalCardSteps extends StatelessWidget {
  const GoalCardSteps({
    super.key,
    required this.goal,
  });

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return goal.steps == null
      ? const SizedBox()
      : Column(children: [
          const SizedBox(
            height: 20,
          ),
          ...goal.steps!.map((e) => NoEditStepListTile(step: e)).toList(),
        ]);
  }
}

class GoalReward extends StatelessWidget {
  const GoalReward({
    super.key,
    required this.goal,
  });

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return goal.reward == null || goal.reward == "" || goal.privateReward
      ? const SizedBox()
      : Align(
          alignment: Alignment.centerLeft,
          child: Text('Reward: ${goal.reward!}'),
        );
  }
}

class GoalExpirationDate extends StatelessWidget {
  const GoalExpirationDate({
    super.key,
    required this.goal,
  });

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return goal.expirationDate == null ? const SizedBox() : Text(Utils.formatDate(goal.expirationDate!));
  }
}

class NoEditDescription extends StatelessWidget {
  const NoEditDescription({
    super.key,
    required this.goal,
  });

  final GoalModel goal;

  @override
  Widget build(BuildContext context) {
    return goal.description == null || goal.description == "" || goal.privateDescription
      ? const SizedBox()
      : Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Description: ${goal.description!}'),
            ),
          ],
        );
  }
}
