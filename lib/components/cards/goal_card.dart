import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_checkbox_button.dart';
import 'package:goly/models/goal.dart';
class GoalCard extends StatelessWidget {
  final GoalModel goal;
  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
        return  Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const MainCheckboxButton(),
                      const SizedBox(width: 20,),
                      Text(goal.title),

                    ],
                  ),
                  Text(goal.description ?? ''),
                ],
              ),
            ),
          ),
        );
  }
}