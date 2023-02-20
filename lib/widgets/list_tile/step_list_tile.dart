import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/step.dart';
import 'package:goly/screens/main/goals/actions/step/handle_step_screen.dart';
import 'package:goly/services/step_service.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/dismissible_list_title.dart';

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
    return DismissibleListTile(
      uniqueKey: ValueKey(widget.step.id),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: ((ctx) => AsyncConfirmationDialog(
                  title: 'Are you sure?',
                  message: 'Do you want to remove this step?',
                  noAction: () {
                    Navigator.of(ctx).pop(false);
                  },
                  yesAction: () async {
                    await StepService.deleteStep(
                            categoryId: widget.categoryId,
                            stepId: widget.step.id,
                            goalId: widget.goalId,
                            step: widget.step)
                        .then((value) => Navigator.of(ctx).pop(true));
                  },
                )));
      },
      child: CheckboxListTile(
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
      ),
    );
  }
}
