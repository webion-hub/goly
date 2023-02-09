import 'package:flutter/material.dart';

class EditProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EditProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Edit profile'),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(100);
}