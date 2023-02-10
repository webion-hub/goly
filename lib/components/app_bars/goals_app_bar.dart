import 'package:flutter/material.dart';
import 'package:goly/pages/main/goals/handle_category_page.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
      actions: [
                IconButton(
          onPressed: () => Navigator.of(context).pushNamed(HandleCategoryPage.routeName),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
