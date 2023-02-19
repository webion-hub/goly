import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/widgets/dialogs/confirmation_dialog.dart';
import 'package:goly/models/category.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/services/category_service.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});
  void noAction(_) {}
  void yesAction(_) {}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dismissible(
        key: ValueKey(category.id),
        background: Container(
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 20,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => ConfirmationDialog(
              title: 'Are you sure?',
              message:
                  'Do you want to remove this category and all the goals inside it?',
              noAction: () {
                Navigator.of(ctx).pop(false);
              },
              yesAction: () {
                CategoryService.deleteCategory(categoryId: category.id);
                Navigator.of(ctx).pop(true);
              },
            ),
          );
        },
        child: ListTile(
          title: Text(category.name),
          onTap: (() => GoRouter.of(context).push(CategoryScreen.routeName, extra: category.id)),
          leading: const Icon(Icons.open_in_new),
          subtitle: category.description != null
              ? Text(
                  category.description!
                      .substring(0, min(category.description!.length, 40)),
                )
              : null,
          trailing: FittedBox(
            child: CircularPercentIndicator(
              radius: 16.0,
              lineWidth: 4.0,
              percent: 0.4,
              progressColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
