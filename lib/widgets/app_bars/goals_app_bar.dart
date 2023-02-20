import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/introductions/explenation_screen.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
      actions: [
        IconButton(
            onPressed: () => GoRouter.of(context).go(ExplenationScreen.routeName),
            icon: const Icon(Icons.question_mark_rounded)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
