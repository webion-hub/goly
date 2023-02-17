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
      subtitle: widget.step.reward != null ? Text(widget.step.reward!) : null,
      controlAffinity: ListTileControlAffinity.leading,
    );

    // return ListTile(
    //   title:  Text(widget.goal.name),
    //   onTap: () {},
    //   leading: const Icon(Icons.open_in_new),
    //   subtitle: widget.goal.reward != null ? Text(widget.goal.reward!) : null,
    //   trailing: FittedBox(
    //     child: CircularPercentIndicator(
    //       radius: 16.0,
    //       lineWidth: 4.0,
    //       percent: 0.4,
    //       progressColor: Colors.green,
    //     ),
    //   ),
  }
}
