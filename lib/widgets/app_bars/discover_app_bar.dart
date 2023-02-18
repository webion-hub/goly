import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/discover/actions/chat_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Discover'),
      actions: [
        IconButton(
          onPressed: () =>
              GoRouter.of(context).push(SettingsScreen.routeName),
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () =>
              GoRouter.of(context).push(RecentConversationsScreen.routeName),
          icon: const Icon(Icons.message_rounded),
        ),
        IconButton(
          onPressed: () =>
              GoRouter.of(context).push(ChatScreen.routeName),
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
