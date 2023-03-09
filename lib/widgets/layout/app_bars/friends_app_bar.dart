import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/add_post_screen.dart';

class FriendsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FriendsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Discover'),
      actions: [
        IconButton(
          onPressed: () => GoRouter.of(context).push(AddPostScreen.routeName),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
