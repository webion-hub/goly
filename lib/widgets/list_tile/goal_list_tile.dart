import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/screens/main/goals/actions/goal/goal_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalListTile extends StatefulWidget {
  final GoalModel goal;
  final String categoryName;
  const GoalListTile(
      {super.key, required this.categoryName, required this.goal});

  @override
  State<GoalListTile> createState() => _GoalListTileState();
}

class _GoalListTileState extends State<GoalListTile> {
  void gotoGoalScreen() {
    GoRouter.of(context).push(GoalScreen.routeName, extra: {'categoryId': widget.categoryName, 'goal': widget.goal});
    //Navigator.of(context).push(CupertinoPageRoute(
    //   builder: (context) => GoalScreen(
    //     categoryName: widget.categoryName,
    //     goal: widget.goal,
    //   ),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    // return widget.goal.steps == null  ? CheckboxListTile(
    //   value: false,
    //   onChanged: (_) {},
    //   title: Text(widget.goal.name),
    //   subtitle: widget.goal.reward != null ? Text(widget.goal.reward!) : null,
    //   controlAffinity: ListTileControlAffinity.leading,
    // ) :

    return ListTile(
      title: Text(widget.goal.name),
      onTap: gotoGoalScreen,
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
