import 'package:flutter/material.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoalsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Goals'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
