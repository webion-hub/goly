import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/step.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/services/step_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/utils/validators.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:goly/widgets/list_tile/settings/settings_list_tile.dart';
import 'package:goly/widgets/settings/settings_switcher_list_tile.dart';
import 'package:goly/utils/constants.dart';

class HandleStepScreen extends StatefulWidget {
  static const String routeNameAdd = "/add-step";
  static const String routeNameEdit = "/edit-step";
  final StepModel? step;
  final int goalId;
  final String categoryId;
  const HandleStepScreen({super.key, this.step, required this.categoryId, required this.goalId});

  @override
  State<HandleStepScreen> createState() => _HandleStepScreenState();
}

class _HandleStepScreenState extends State<HandleStepScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController stepName = TextEditingController(text: widget.step?.name ?? '');
  late TextEditingController reward = TextEditingController(text: widget.step?.reward ?? '');
  late DateTime? expirationDate = widget.step?.expirationDate;
  bool privateStep = false;
  bool privateReward = false;

  void privateStepChange(bool value) {
    setState(() {
      privateStep = value;
    });
  }

  void privateRewardChange(bool value) {
    setState(() {
      privateReward = value;
    });
  }

  void _showDatePicker() async {
    await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        firstDate: DateTime.now(),
        lastDate: DateTime(
          (DateTime.now().year + 10),
        ),
      ),
      dialogSize: const Size(325, 400),
      value: [DateTime.now()],
    ).then((value) => expirationDate = value?.first);
    setState(() {});
  }

  void addStep() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    var numberOfSteps = await GoalService.getNumberOfSteps(categoryId: widget.categoryId, goalId: widget.goalId);
    StepModel step = StepModel(
      id: widget.step?.id ?? numberOfSteps,
      name: stepName.text,
      reward: reward.text,
      privateStep: privateStep,
      privateReward: privateReward,
      expirationDate: expirationDate,
    );
    if (widget.step == null) {
      await StepService.addStepToGoal(categoryId: widget.categoryId, goalId: widget.goalId, step: step)
        .then((value) => Navigator.of(context).pop());
    } else {
      await StepService.editStep(
        categoryId: widget.categoryId,
        goalId: widget.goalId,
        step: step,
      )
      .then((value) => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.step != null ? 'Edit step' : 'Add step'),
      ),
      body: SingleChildScrollView(
        padding: Constants.pagePadding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldInput(
                textEditingController: stepName,
                hintText: 'Name',
                textInputType: TextInputType.text,
                label: 'Name',
                validation: Validations.validateNotEmpty,
              ),
              TextFieldInput(
                textEditingController: reward,
                hintText: 'Reward',
                textInputType: TextInputType.text,
                label: 'Reward',
              ),
              SettingsListTile(
                icon: Icons.date_range_outlined,
                text: expirationDate == null ? 'Set an expiration date' : 'Expiration date: ${Utils.formatDate(expirationDate!)}',
                onTap: _showDatePicker,
                ifTrailing: false,
              ),
              SettingsSwitcherListTile(
                  initialValue: privateStep,
                  icon: Icons.lock,
                  text: "Private step",
                  subtitle: "Makes the step private",
                  onChanged: privateStepChange),
              const SizedBox(height: 20.0),
              SettingsSwitcherListTile(
                  inactive: privateStep,
                  initialValue: privateStep ? true : privateReward,
                  icon: Icons.lock,
                  text: "Private reward",
                  subtitle: "Makes reward private",
                  onChanged: privateRewardChange),
              MainButton(
                text: widget.step != null ? 'Edit step' : 'Add step',
                onPressed: addStep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
