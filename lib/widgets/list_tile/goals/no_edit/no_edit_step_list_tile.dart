import 'package:flutter/material.dart';
import 'package:goly/models/step.dart';
import 'package:goly/utils/utils.dart';

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
      subtitle: step.expirationDate != null
        ? Text(Utils.formatDate(step.expirationDate!))
        : null,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
