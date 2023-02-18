import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/main.dart';
import 'package:goly/responsive/page_shell.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/main/discover/actions/chat_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/utils.dart';
final router = GoRouter(
  initialLocation: AuthScreen.routeName,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          redirect: ((context, state) {
            return AuthScreen.routeName;
            if(FirebaseAuth.instance.currentUser != null) {
              return DiscoverScreen.routeName;
            } else {
              return AuthScreen.routeName;
            }
          }),
          //builder: (context, state) => const Home(),
        ),

        /// Auth screens
        GoRoute(
          path: AuthScreen.routeName,
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(
          path: ForgotPasswordScreen.routeName,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),

        /// Discover
        GoRoute(
          path: DiscoverScreen.routeName,
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: RecentConversationsScreen.routeName,
          builder: (context, state) => const RecentConversationsScreen(),
        ),
        /// Goals
        GoRoute(
          path: GoalsScreen.routeName,
          builder: (context, state) => const GoalsScreen(),
        ),

        /// Profile
        GoRoute(
          path: ProfileScreen.routeName,
          builder: (context, state) => ProfileScreen(profileId: Utils.currentUid()),
        ),
        GoRoute(
          path: SettingsScreen.routeName,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
      builder:(context, state, child) {
        if(state.fullpath == AuthScreen.routeName || state.fullpath == ForgotPasswordScreen.routeName) {
          return child;
        }
        return PageShell(child:child);
      },
    )

  ]
);