import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goly/widgets/form/buttons/main_button.dart';
import 'package:goly/widgets/form/input/text_field_input.dart';
import 'package:goly/widgets/settings/settings_switcher_list_tile.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/services/goal_service.dart';
import 'package:goly/utils/constants.dart';

class HandleGoalScreen extends StatefulWidget {
  static const String routeNameAdd = "/add-goal";
  static const String routeNameEdit = "/edit-goal";
  final GoalModel? goal;
  final String categoryId;
  const HandleGoalScreen({super.key, this.goal, required this.categoryId});

  @override
  State<HandleGoalScreen> createState() => _HandleGoalScreenState();
}

class _HandleGoalScreenState extends State<HandleGoalScreen> {
  late final TextEditingController _goalName =
      TextEditingController(text: widget.goal?.name ?? '');
  late final TextEditingController _description =
      TextEditingController(text: widget.goal?.description ?? '');
  late final TextEditingController _reward =
      TextEditingController(text: widget.goal?.reward ?? '');
  late final TextEditingController _priority =
      TextEditingController(text: widget.goal?.priority.toString() ?? '1');
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
  void dispose() {
    super.dispose();
    _goalName.dispose();
    _description.dispose();
    _reward.dispose();
    _priority.dispose();
  }

  void addGoal() async {
    if (widget.goal != null) {
      GoalModel editedGoal = GoalModel(
        id: widget.goal!.id,
        name: _goalName.text,
        description: _description.text,
        reward: _reward.text,
        privateGoal: privateGoal,
        privateDescription: privateDescription,
        privateReward: privateReward,
        steps: widget.goal?.steps,
      );

      await GoalService.editGoal(
              categoryId: widget.categoryId, goal: editedGoal)
          .then((value) => Navigator.of(context).pop());
    } else {
      final id =
          await CategoryService.getNumberofGoals(categoryId: widget.categoryId);
      GoalModel newGoal = GoalModel(
        id: id,
        name: _goalName.text,
        description: _description.text,
        reward: _reward.text,
        privateGoal: privateGoal,
        privateDescription: privateDescription,
        privateReward: privateReward,
      );
      await GoalService.addGoal(categoryId: widget.categoryId, goal: newGoal)
          .then((value) => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.goal != null ? 'Edit goal' : 'Add goal'),
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
                    TextFieldInput(
                      textEditingController: _goalName,
                      hintText: 'Name',
                      textInputType: TextInputType.text,
                      label: 'Name',
                    ),
                    TextFieldInput(
                      textEditingController: _description,
                      hintText: 'Description',
                      textInputType: TextInputType.multiline,
                      maxLines: 3,
                      label: 'Description',
                    ),
                    TextFieldInput(
                      textEditingController: _reward,
                      hintText: 'Reward',
                      textInputType: TextInputType.text,
                      maxLines: 3,
                      label: 'Reward',
                    ),
                    TextFieldInput(
                      textEditingController: _priority,
                      hintText: 'Priority',
                      textInputType: TextInputType.number,
                      label: 'Priority (1 to 10)',
                      validation: (input) {
                        final isDigitsOnly = int.tryParse(input ?? '');
                        return isDigitsOnly == null
                            ? 'Input needs to be digits only'
                            : null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    SettingsSwitcherListTile(
                        initialValue: privateGoal,
                        icon: Icons.lock,
                        text: "Private goal",
                        subtitle: "Makes private all the goals inside it",
                        onChanged: privateGoalChange),
                    const SizedBox(height: 20.0),
                    SettingsSwitcherListTile(
                        inactive: privateGoal,
                        initialValue: privateGoal ? true : privateDescription,
                        icon: Icons.lock,
                        text: "Private description",
                        subtitle: "Makes description private",
                        onChanged: privateDescriptionChange),
                    const SizedBox(height: 20.0),
                    SettingsSwitcherListTile(
                        inactive: privateGoal,
                        initialValue: privateGoal ? true : privateReward,
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
      ),
    );
  }
}
