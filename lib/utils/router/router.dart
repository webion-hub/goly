import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/providers/go_router_provider.dart';
import 'package:goly/screens/responsive/page_shell.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/auth/error_screen.dart';
import 'package:goly/screens/introductions/explanation_screen.dart';
import 'package:goly/screens/main/feed/feed_screen.dart';
import 'package:goly/utils/router/pages/auth_pages.dart';
import 'package:goly/utils/router/pages/main/add_pages.dart';
import 'package:goly/utils/router/pages/main/friends_pages.dart';
import 'package:goly/utils/router/pages/main/goal_pages.dart';
import 'package:goly/utils/router/pages/introduction_pages.dart';
import 'package:goly/utils/router/pages/main/profile_pages.dart';
import 'package:goly/utils/router/pages/main/statistics_pages.dart';

final router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser == null
      ? AuthScreen.routeName
      : FeedScreen.routeName,
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: ErrorScreen(error: state.error),
  ),
  refreshListenable: GoRouterProvider(FirebaseAuth.instance.authStateChanges()),
  // redirect:(context, state) async {
  //   if(FirebaseAuth.instance.currentUser == null) {
  //     return AuthScreen.routeName;
  //   }
  // },
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          redirect: ((context, state) {
            return FeedScreen.routeName;
          }),
        ),
        ...introductionPages,
        ...authPages,

        //Bottom navigation bar pages
        ...friendsPages,
        ...goalPages,
        ...addPages,
        ...statisticsPages,
        ...profilePages,
      ],
      builder: (context, state, child) {
        if (state.fullpath == AuthScreen.routeName ||
            state.fullpath == ForgotPasswordScreen.routeName ||
            state.fullpath == ExplanationScreen.routeName) {
          return child;
        }
        return PageShell(child: child);
      },
    )
  ],
);
