import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/goal_service.dart';

class MarkAsCompletedListTile extends StatefulWidget {
  final String categoryId;
  final GoalModel goal;

  const MarkAsCompletedListTile(
      {super.key, required this.categoryId, required this.goal});

  @override
  State<MarkAsCompletedListTile> createState() =>
      _MarkAsCompletedListTileState();
}

class _MarkAsCompletedListTileState extends State<MarkAsCompletedListTile> {
  void toggleGoalCompleted(bool? value) async {
    if (value != null) {
      widget.goal.completed = value;
      await GoalService.toggleCategoryCompleted(categoryId: widget.categoryId, goal: widget.goal, value: value);
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: CheckboxListTile(
        onChanged: toggleGoalCompleted,
        value: widget.goal.completed,
        title: const Text('Mark this goal as completed'),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
