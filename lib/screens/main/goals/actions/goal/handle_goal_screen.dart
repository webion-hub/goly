import 'package:flutter/material.dart';
import 'package:goly/widgets/buttons/main_button.dart';
import 'package:goly/widgets/settings/settings_switcher.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';

class HandleGoalScreen extends StatefulWidget {
  static String routeName = "add-goal";
  final GoalModel? goal;
  final String categoryId;
  const HandleGoalScreen({super.key, this.goal, required this.categoryId});

  @override
  State<HandleGoalScreen> createState() => _HandleGoalScreenState();
}

class _HandleGoalScreenState extends State<HandleGoalScreen> {
  late TextEditingController goalName =
      TextEditingController(text: widget.goal?.name ?? '');
  late TextEditingController description =
      TextEditingController(text: widget.goal?.description ?? '');
  late TextEditingController reward =
      TextEditingController(text: widget.goal?.reward ?? '');
  bool privateGoal = false;
  bool privateDescription = false;
  bool privateReward = false;

  void privateGoalChange(bool value) {
    setState(() {
      privateGoal = value;
    });
  }

  void privateDescriptionChange(bool value) {
    setState(() {
      privateDescription = value;
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
    void addGoal() async {
      int? goalId;
      if(widget.goal == null) {
        goalId = await CategoryService.getNumberofGoals(categoryId: widget.categoryId);
      }
      await GoalService.addGoal(
        categoryId: widget.categoryId,
        goal: GoalModel(
          id: widget.goal?.id ?? goalId!,
          name: goalName.text,
          description: description.text,
          reward: reward.text,
          privateGoal: privateGoal,
          privateDescription: privateDescription,
          privateReward: privateReward,
        ),
      ).then((value) => Navigator.of(context).pop());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.goal != null ? 'Edit goal' : 'Add goal'),
      ),
      body: Column(children: [
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
                    controller: goalName,
                    decoration: const InputDecoration(labelText: 'Name'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: description,
                    decoration: const InputDecoration(labelText: 'Description'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: reward,
                    decoration: const InputDecoration(labelText: 'Reward'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20.0),
                  SettingsSwitcher(
                      initialValue: privateGoal,
                      icon: Icons.lock,
                      text: "Private goal",
                      subtitle: "Makes private all the goals inside it",
                      onChanged: privateGoalChange),
                  const SizedBox(height: 20.0),
                  SettingsSwitcher(
                      initialValue: privateDescription,
                      icon: Icons.lock,
                      text: "Private description",
                      subtitle: "Makes description private",
                      onChanged: privateDescriptionChange),
                  const SizedBox(height: 20.0),
                  SettingsSwitcher(
                      initialValue: privateReward,
                      icon: Icons.lock,
                      text: "Private reward",
                      subtitle: "Makes reward private",
                      onChanged: privateRewardChange),
                  MainButton(
                    text: widget.goal != null ? 'Edit goal' : 'Add goal',
                    onPressed: addGoal,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
