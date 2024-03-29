import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/screens/main/goals/actions/goal/goal_screen.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/dismissible/dismissible_list_title.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalListTile extends StatefulWidget {
  final GoalModel goal;
  final String categoryId;
  const GoalListTile({super.key, required this.categoryId, required this.goal});

  @override
  State<GoalListTile> createState() => _GoalListTileState();
}

class _GoalListTileState extends State<GoalListTile> {
  void gotoGoalScreen() {
    GoRouter.of(context).push(
      GoalScreen.routeName,
      extra: {'categoryId': widget.categoryId, 'goalId': widget.goal.id}
    );
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleListTile(
      uniqueKey: ValueKey(widget.goal.id),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: ((ctx) => AsyncConfirmationDialog(
            title: 'Are you sure?',
            message:
                'Do you want to remove this goal and all the steeps inside it?',
            noAction: () {
              Navigator.of(ctx).pop(false);
            },
            yesAction: () async {
              await GoalService.deleteGoal(
                      categoryId: widget.categoryId, goalId: widget.goal.id)
                  .then((value) => Navigator.of(ctx).pop());
            },
          )),
        );
      },
      child: ListTile(
        title: Text(widget.goal.name),
        onTap: gotoGoalScreen,
        leading: FittedBox(
          child: CircularPercentIndicator(
            radius: 16.0,
            lineWidth: 4.0,
            percent: GoalService.getPercentageOfCompletition(widget.goal),
            progressColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle: widget.goal.expirationDate != null
            ? Text(Utils.formatDate(widget.goal.expirationDate!))
            : null,
        trailing:
            Icon(Constants.getLockerIcon(private: widget.goal.privateGoal)),
      ),
    );
  }
}
