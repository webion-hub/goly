import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/cards/goals/goal_card.dart';

class ProfileCategoryGoals extends StatelessWidget {
  final String categoryId;
  final String uid;
  const ProfileCategoryGoals(
      {super.key, required this.categoryId, required this.uid});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CategoryService.getCategoryGoalsStream(
            categoryId: categoryId, uid: uid),
        builder: (context, goalSnapshot) {
          if (!goalSnapshot.hasData) {
            return const Text('Start adding some data');
          }

          List<GoalModel> goals = [];
          for (var goal in goalSnapshot.data!.docs) {
            goals.add(GoalModel.fromJson(
              goal.data(),
            ));
          }
          int numberOfPublicGoals =
              goals.where((goal) => !goal.privateGoal).length;
          if (numberOfPublicGoals == 0) {
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('There are no public goals in this category'));
          }
          return Column(
              children: goals
                  .map(
                    (goal) => Column(
                      children: [
                        const SizedBox(height: 30),
                        GoalCard(
                          goal: goal,
                        ),
                      ],
                    ),
                  )
                  .toList());
        });
  }
}
