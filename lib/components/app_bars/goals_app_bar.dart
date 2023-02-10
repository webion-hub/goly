import 'package:flutter/material.dart';
import 'package:goly/pages/main/goals/add_category.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
      actions: [
                IconButton(
          onPressed: () => Navigator.of(context).pushNamed(AddCategoryPage.routeName),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
