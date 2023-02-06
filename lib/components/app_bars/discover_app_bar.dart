import 'package:flutter/material.dart';
import 'package:goly/pages/main/settings_page.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Discover'),
      actions: [
        
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SettingsPage(),
            ),
          ),
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SettingsPage(),
            ),
          ),
          icon: const Icon(Icons.message_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
