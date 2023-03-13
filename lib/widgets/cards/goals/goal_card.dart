import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/widgets/list_tile/goals/no_edit/no_edit_step_list_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalCard extends StatelessWidget {
  final GoalModel goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  FittedBox(
                    child: CircularPercentIndicator(
                      radius: 16.0,
                      lineWidth: 4.0,
                      percent: GoalService.getPercentageOfCompletition(goal),
                      progressColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(goal.name),
                ],
              ),
              NoEditDescription(description: goal.description),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: goal.steps
                        ?.map((e) => NoEditStepListTile(step: e))
                        .toList() ??
                    [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoEditDescription extends StatelessWidget {
  const NoEditDescription({
    super.key,
    required this.description,
  });

  final String? description;

  @override
  Widget build(BuildContext context) {
    return description == null || description == ""
        ? const SizedBox()
        : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(alignment: Alignment.centerLeft, child: Text(description!)),
            ],
          );
  }
}
