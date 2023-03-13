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
          return Column(
              children: goalSnapshot.data!.docs
                  .map(
                    (e) => Column(
                      children: [
                        const SizedBox(height: 30),
                        GoalCard(
                          goal: GoalModel.fromJson(
                            e.data(),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList());
        });
  }
}
