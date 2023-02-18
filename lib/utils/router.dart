import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/main.dart';
import 'package:goly/responsive/mobile_screen_layout.dart';
import 'package:goly/responsive/page_shell.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/utils.dart';
final router = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: '/goals',
          builder: (context, state) => const GoalsScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => ProfileScreen(profileId: Utils.currentUid()),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
      builder:(context, state, child) {
        return PageShell(child:child);
      },
    )

  ]
);