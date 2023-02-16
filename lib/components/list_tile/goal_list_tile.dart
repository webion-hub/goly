import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalListTile extends StatefulWidget {
  final GoalModel goal;
  const GoalListTile({super.key, required this.goal});

  @override
  State<GoalListTile> createState() => _GoalListTileState();
}

class _GoalListTileState extends State<GoalListTile> {
  @override
  Widget build(BuildContext context) {
    
    return widget.goal.steps == null  ? CheckboxListTile(
      value: false,
      onChanged: (_) {},
      title: Text(widget.goal.name),
      subtitle: widget.goal.reward != null ? Text(widget.goal.reward!) : null,
      controlAffinity: ListTileControlAffinity.leading,
    ) :
    ListTile(
      title:  Text(widget.goal.name),
      onTap: () {},
      leading: const Icon(Icons.open_in_new),
      subtitle: widget.goal.reward != null ? Text(widget.goal.reward!) : null,
      trailing: FittedBox(
        child: CircularPercentIndicator(
          radius: 16.0,
          lineWidth: 4.0,
          percent: 0.4,
          progressColor: Colors.green,
        ),
      ),

      
    );
 
  }
}
