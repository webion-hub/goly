import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/widgets/cards/action_card.dart';
import 'package:goly/widgets/cards/description_card.dart';
import 'package:goly/widgets/dialogs/confirmation_dialog.dart';
import 'package:goly/widgets/list_tile/goal_list_tile.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category";
  final String categoryId;
  const CategoryScreen({super.key, required this.categoryId});
  void goToHandleCategory(BuildContext context, CategoryModel category) {
    GoRouter.of(context)
        .push(HandleCategoryScreen.routeNameEdit, extra: category);
  }

  @override
  Widget build(BuildContext context) {
    void deleteCategory() {
      showDialog(
        context: context,
        builder: (context) => AsyncConfirmationDialog(
          title: 'Are you sure?',
          message:
              'Are you sure you want to delete this category? All goals inside it will be deleted',
          noAction: () {
            Navigator.of(context).pop();
          },
          yesAction: () async {
            Navigator.of(context).pop();
            GoRouter.of(context).go(GoalsScreen.routeName);
            await CategoryService.deleteCategory(categoryId: categoryId);
          },
        ),
      );
    }

    void goToHandleGoal() {
      GoRouter.of(context)
          .push(HandleGoalScreen.routeNameAdd, extra: categoryId);
    }

    return StreamBuilder(
        stream: CategoryService.getCategoryStream(categoryId: categoryId),
        builder: (context, categorySnapshot) {
          if (categorySnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!categorySnapshot.hasData ||
              categorySnapshot.data?.data() == null) {
            return const Center(
              child: Text('error'),
            );
          }
          CategoryModel category =
              CategoryModel.fromJson(categorySnapshot.data!.data()!);

          return Scaffold(
            appBar: AppBar(
              title: Text(category.name),
              actions: [
                IconButton(
                  onPressed: () => goToHandleCategory(context, category),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: deleteCategory,
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: Constants.pagePadding,
              child: Column(children: [
                category.description != null
                    ? DescriptionCard(text: category.description!)
                    : const SizedBox(),
                StreamBuilder(
                    stream: CategoryService.getCategoryGoals(
                        categoryId: category.id),
                    builder: (context, goalSnapshot) {
                      if (!goalSnapshot.hasData) {
                        return const Text('Start adding some data');
                      }
                      return Column(
                          children: goalSnapshot.data!.docs
                              .map(
                                (e) => GoalListTile(
                                  categoryId: category.id,
                                  goal: GoalModel.fromJson(
                                    e.data(),
                                  ),
                                ),
                              )
                              .toList());
                    }),
                ActionCard(
                  text: 'Add goal',
                  icon: Icons.add,
                  action: goToHandleGoal,
                ),
              ]),
            ),
          );
        });
  }
}
