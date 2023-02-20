import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/step.dart';
import 'package:goly/screens/main/goals/actions/step/handle_step_screen.dart';

class StepListTile extends StatefulWidget {
  final StepModel step;
  final String categoryId;
  final int goalId;
  const StepListTile(
      {super.key,
      required this.step,
      required this.categoryId,
      required this.goalId});

  @override
  State<StepListTile> createState() => _StepListTileState();
}

class _StepListTileState extends State<StepListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      onChanged: (_) {},
      title: Text(widget.step.name),
      subtitle: widget.step.reward != "" ? Text(widget.step.reward!) : null,
      controlAffinity: ListTileControlAffinity.leading,
      secondary: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () => GoRouter.of(context)
            .push(HandleStepScreen.routeNameEdit, extra: {
          'step': widget.step,
          'categoryId': widget.categoryId,
          'goalId': widget.goalId
        }),
      ),
    );
  }
}
