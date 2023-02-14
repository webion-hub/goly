import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_button.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/utils/constants.dart';

class HandleGoalPage extends StatelessWidget {
  static String routeName = "add-goal";
  final GoalModel? goal;
  const HandleGoalPage({super.key, this.goal});

  @override
  Widget build(BuildContext context) {
    TextEditingController goalName = TextEditingController(text: goal?.title ?? '');
    TextEditingController description = TextEditingController(text: goal?.description ?? '');
    final formKey = GlobalKey<FormState>();
    void addgoal() {
      //GoalModel c = GoalModel(id:'1', title: goal.title, private: false, description: description.text);
      //print(c.toJson());

      //FirebaseFirestore.instance.collection('users').doc(Utils.currentUid()).set();

    }
    return Scaffold(
      appBar: AppBar(title: Text(goal !=null ? 'Edit goal' : 'Add goal')),
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
                MainButton(text: goal !=null ? 'Edit goal' : 'Add goal', onPressed: addgoal),
              ],
            ),
          ),
        ),
      ),
      ]),
    );
  }
}
