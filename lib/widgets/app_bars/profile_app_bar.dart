import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/utils/constants.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Constants.appName.toUpperCase()),
      actions: [
        IconButton(
          onPressed: () => GoRouter.of(context).push('/settings'),
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
