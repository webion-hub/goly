import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/add_post_screen.dart';
import 'package:goly/screens/main/chat/recent_conversations_screen.dart';
import 'package:goly/screens/main/friends/actions/search/search_screen.dart';

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
        IconButton(
          onPressed: () =>
              GoRouter.of(context).push(RecentConversationsScreen.routeName),
          icon: const Icon(Icons.message_rounded),
        ),
        IconButton(
          onPressed: () => GoRouter.of(context).push(SearchScreen.routeName),
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
