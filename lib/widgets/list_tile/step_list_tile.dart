import 'package:flutter/material.dart';
import 'package:goly/models/step.dart';

class StepListTile extends StatefulWidget {
  final StepModel step;
  const StepListTile({super.key, required this.step});

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
    );
  }
}
