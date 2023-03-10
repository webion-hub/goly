import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/widgets/dialogs/async_confirmation_dialog.dart';
import 'package:goly/models/category.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/list_tile/dismissible/dismissible_list_title.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(category.id),
      child: DismissibleListTile(
          uniqueKey: ValueKey(category.id),
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: ((ctx) => AsyncConfirmationDialog(
                    title: 'Are you sure?',
                    message:
                        'Do you want to remove this category and all the goals inside it?',
                    noAction: () {
                      Navigator.of(ctx).pop(false);
                    },
                    yesAction: () async {
                      Navigator.of(ctx).pop();
                      await CategoryService.deleteCategory(
                          categoryId: category.id);
                    },
                  )),
            );
          },
          child: ListTile(
            title: Text(category.name),
            onTap: (() => GoRouter.of(context)
                .push(CategoryScreen.routeName, extra: category.id)),
            leading: const Icon(Icons.open_in_new),
            subtitle: category.description != null &&
                    category.description!.isNotEmpty
                ? Text(
                    category.description!
                        .substring(0, min(category.description!.length, 40)),
                  )
                : null,
            trailing: Icon(
              Constants.getLockerIcon(private: category.private),
            ),
          )),
    );
  }
}
