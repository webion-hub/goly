import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/cards/action_card.dart';
import 'package:goly/components/cards/description_card.dart';
import 'package:goly/components/dialogs/confirmation_dialog.dart';
import 'package:goly/components/list_tile/goal_list_tile.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/pages/main/goals/actions/category/handle_category_page.dart';
import 'package:goly/pages/main/goals/actions/goal/handle_goal_page.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    void goToHandleCategory(CategoryModel category) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => HandleCategoryPage(
                category: category,
              )));
    }

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
        builder: (context) => HandleGoalPage(
          categoryName: categoryName,
        ),
      ));
    }

    return StreamBuilder(
        stream: CategoryService.getCategoryStream(categoryId: categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('error'),
            );
          }
          var category = CategoryModel.fromJson(snapshot.data!.data()!);
          print(category.toJson());
          return Scaffold(
            appBar: AppBar(
              title: Text(categoryName),
              actions: [
                IconButton(
                  onPressed: () => goToHandleCategory(category),
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
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text('Start adding some data');
                        }
                        List<GoalModel> goals = List.empty();
                        print(snapshot.data!.docs);

                        snapshot.data!.docs.map((element) {
                          print("$element a");
                          goals.add(GoalModel.fromJson(element.data()));
                        });
                        return Column(
                            children: snapshot.data!.docs
                                .map((e) => GoalListTile(
                                    categoryName: category.name,
                                    goal: GoalModel.fromJson(e.data())))
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
