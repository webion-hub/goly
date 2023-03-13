import 'package:flutter/material.dart';
import 'package:goly/models/step.dart';

class NoEditStepListTile extends StatelessWidget {
  final StepModel step;
  const NoEditStepListTile({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: step.completed,
      onChanged: null,
      title: Text(
        step.name,
        style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
      ),
      subtitle: step.reward != "" ? Text(step.reward!) : null,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
