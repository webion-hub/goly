import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});
  void goToHandleCategory(BuildContext context, CategoryModel category) {
    GoRouter.of(context)
        .push(HandleCategoryScreen.routeNameHandle, extra: category);
  }

  @override
  Widget build(BuildContext context) {
    void deleteCategory() {
      showDialog(
        context: context,
        builder: (context) => ConfirmationDialog(
          title: 'Are you sure?',
          message:
              'Are you sure you want to delete this category? All goals inside it will be deleted',
          noAction: () {
            Navigator.of(context).pop();
          },
          yesAction: () {
            CategoryService.deleteCategory(categoryId: categoryName);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      );
    }

    void goToHandleGoal() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleGoalScreen(
          categoryName: categoryName,
        ),
      ));
    }

    return StreamBuilder(
        stream: CategoryService.getCategoryStream(categoryId: categoryName),
        builder: (context, categorySnapshot) {
          if (categorySnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!categorySnapshot.hasData) {
            return const Center(
              child: Text('error'),
            );
          }
          var category = CategoryModel.fromJson(categorySnapshot.data!.data()!);
          return Scaffold(
            appBar: AppBar(
              title: Text(categoryName),
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
            body: Center(
              child: Container(
                padding: Constants.pagePadding,
                child: Column(children: [
                  category.description != null
                      ? DescriptionCard(text: category.description!)
                      : const SizedBox(),
                  StreamBuilder(
                      stream: CategoryService.getCategoryGoals(
                          categoryId: category.name),
                      builder: (context, goalSnapshot) {
                        if (!goalSnapshot.hasData) {
                          return const Text('Start adding some data');
                        }
                        return Column(
                            children: goalSnapshot.data!.docs
                                .map(
                                  (e) => GoalListTile(
                                    categoryName: category.name,
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
            ),
          );
        });
  }
}
