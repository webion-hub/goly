import 'package:flutter/material.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/cards/goals/goal_card.dart';
import 'package:goly/widgets/profile/user_category_posts.dart';

class ProfileCategoryGoals extends StatelessWidget {
  final String categoryId;
  final String uid;
  final String categoryName;
  const ProfileCategoryGoals({
    super.key,
    required this.categoryId,
    required this.uid,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CategoryService.getCategoryGoalsStream(
            categoryId: categoryId, uid: uid),
        builder: (context, goalSnapshot) {
          if (!goalSnapshot.hasData) {
            return const Text('There are no categories');
          }

          List<GoalModel> goals = [];
          for (var goal in goalSnapshot.data!.docs) {
            goals.add(GoalModel.fromJson(
              goal.data(),
            ));
          }
          int numberOfPublicGoals =
              goals.where((goal) => !goal.privateGoal).length;

          return Column(
            children: [
              ProfileCategoryGoalsSection(goals: goals),
              UserCategoryPosts(uid: uid, categoryName: categoryName),
            ],
          );
        });
  }
}

class ProfileCategoryGoalsSection extends StatelessWidget {
  const ProfileCategoryGoalsSection({
    super.key,
    required this.goals,
  });

  final List<GoalModel> goals;

  @override
  Widget build(BuildContext context) {
    int numberOfPublicGoals = goals.where((goal) => !goal.privateGoal).length;
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          'Goals',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        numberOfPublicGoals == 0
            ? const Text('There are no public goals in this category')
            : const SizedBox(),
        const SizedBox(height: 15),
        ...goals
            .map(
              (goal) => Column(
                children: [
                  GoalCard(
                    goal: goal,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}
