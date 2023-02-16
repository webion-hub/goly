import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/cards/action_card.dart';
import 'package:goly/components/cards/description_card.dart';
import 'package:goly/components/list_tile/goal_list_tile.dart';
import 'package:goly/models/category.dart';
import 'package:goly/pages/main/goals/actions/category/handle_category_page.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/constants.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;
  const CategoryPage({super.key, required this.category});
  void deleteCategory() {
    CategoryService.deleteCategories(categoryId: category.name);
  }

  @override
  Widget build(BuildContext context) {
    void goToHandleCategory() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleCategoryPage(
          category: category,
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: goToHandleCategory,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: goToHandleCategory,
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
            ...?category.goals?.map((goal) => GoalListTile(goal: goal)),
            ActionCard(
              text: 'Add goal',
              icon: Icons.add,
              action: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
