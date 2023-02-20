import 'package:flutter/material.dart';
import 'package:goly/models/step.dart';
import 'package:goly/widgets/buttons/main_button.dart';
import 'package:goly/widgets/settings/settings_switcher.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';

class HandleStepScreen extends StatefulWidget {
  static String routeNameAdd = "/add-step";
  static String routeNameEdit = "/edit-step";
  final StepModel? step;
  final int goalId;
  final String categoryId;
  const HandleStepScreen({super.key, this.step, required this.categoryId, required this.goalId});

  @override
  State<HandleStepScreen> createState() => _HandleStepScreenState();
}

class _HandleStepScreenState extends State<HandleStepScreen> {
  late TextEditingController stepName =
      TextEditingController(text: widget.step?.name ?? '');
  late TextEditingController reward =
      TextEditingController(text: widget.step?.reward ?? '');
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

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    void addStep() async {
      if(widget.step != null) {
        StepModel step = StepModel(
          name: stepName.text,
          reward: reward.text,
          privateStep: privateStep,
          privateReward: privateReward,
        );
        await GoalService.addStepToGoal(categoryId: widget.categoryId, goalId: widget.goalId, step: step).then((value) => Navigator.of(context).pop());
      } 
      // else {
      //   final id = await CategoryService.getNumberofGoals(categoryId: widget.categoryId);
      //     GoalModel newGoal = GoalModel(
      //     id: id,
      //     name: stepName.text,
      //     description: description.text,
      //     reward: reward.text,
      //     privateStep: privateStep,
      //     privateDescription: privateDescription,
      //     privateReward: privateReward,
      //   );
      //   await GoalService.addStep(categoryId: widget.categoryId, goal: newGoal).then((value) => Navigator.of(context).pop());
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.step != null ? 'Edit step' : 'Add step'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              padding: Constants.pagePadding,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: stepName,
                      decoration: const InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: reward,
                      decoration: const InputDecoration(labelText: 'Reward'),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20.0),
                    SettingsSwitcher(
                        initialValue: privateStep,
                        icon: Icons.lock,
                        text: "Private step",
                        subtitle: "Makes the step private",
                        onChanged: privateStepChange),
                    const SizedBox(height: 20.0),
                    SettingsSwitcher(
                        initialValue: privateReward,
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
          ),
        ]),
      ),
    );
  }
}
