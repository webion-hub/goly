import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';
import 'package:goly/providers/go_router_refresh_stream.dart';
import 'package:goly/screens/responsive/page_shell.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/auth/error_screen.dart';
import 'package:goly/screens/introductions/explenation_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/goal_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/screens/main/goals/actions/step/handle_step_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/utils.dart';

final router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser == null
      ? AuthScreen.routeName
      : DiscoverScreen.routeName,
  errorPageBuilder: (context, state) => MaterialPage<void>(
    key: state.pageKey,
    child: ErrorScreen(error: state.error),
  ),
  refreshListenable:
      GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          redirect: ((context, state) {
            return DiscoverScreen.routeName;
          }),
        ),

        /// Introductions
        GoRoute(
          path: ExplenationScreen.routeName,
          builder: (context, state) => const ExplenationScreen(),
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
        GoRoute(
            path: HandleGoalScreen.routeNameAdd,
            builder: (context, state) {
              return HandleGoalScreen(categoryId: state.extra.toString());
            }),
        GoRoute(
          path: HandleCategoryScreen.routeNameAdd,
          builder: (context, state) => const HandleCategoryScreen(),
        ),
        GoRoute(
          path: HandleCategoryScreen.routeNameEdit,
          builder: (context, state) {
            CategoryModel category = state.extra as CategoryModel;
            return HandleCategoryScreen(
              category: category,
            );
          },
        ),
        GoRoute(
            path: CategoryScreen.routeName,
            builder: (context, state) {
              String categoryId = state.extra.toString();
              return CategoryScreen(categoryId: categoryId);
            }),
        GoRoute(
            path: GoalScreen.routeName,
            builder: (context, state) {
              Map<String, Object> extras = state.extra as Map<String, Object>;
              String categoryId = extras['categoryId'] as String;
              int goalId = extras['goalId'] as int;
              return GoalScreen(
                goalId: goalId,
                categoryId: categoryId,
              );
            }),
        GoRoute(
            path: HandleGoalScreen.routeNameEdit,
            builder: (context, state) {
              Map<String, Object> extras = state.extra as Map<String, Object>;
              String categoryId = extras['categoryId'] as String;
              GoalModel? goal = extras['goal'] as GoalModel;
              return HandleGoalScreen(
                goal: goal,
                categoryId: categoryId,
              );
            }),
        GoRoute(
            path: CategoryScreen.routeName,
            builder: (context, state) {
              String categoryId = state.extra.toString();
              return CategoryScreen(categoryId: categoryId);
            }),
        GoRoute(
            path: HandleStepScreen.routeNameAdd,
            builder: (context, state) {
              Map<String, Object> extras = state.extra as Map<String, Object>;
              String categoryId = extras['categoryId'] as String;
              int goalId = extras['goalId'] as int;
              return HandleStepScreen(
                goalId: goalId,
                categoryId: categoryId,
              );
            }),
        GoRoute(
            path: HandleStepScreen.routeNameEdit,
            builder: (context, state) {
              Map<String, Object> extras = state.extra as Map<String, Object>;
              String categoryId = extras['categoryId'] as String;
              int goalId = extras['goalId'] as int;
              StepModel? step = extras['step'] as StepModel;
              return HandleStepScreen(
                goalId: goalId,
                step: step,
                categoryId: categoryId,
              );
            }),

        /// Profile
        GoRoute(
          path: ProfileScreen.routeName,
          builder: (context, state) =>
              ProfileScreen(profileId: Utils.currentUid()),
        ),
        GoRoute(
          path: HandleProfileScreen.routeName,
          builder: (context, state) =>
              HandleProfileScreen(uid: Utils.currentUid()),
        ),
        GoRoute(
          path: SettingsScreen.routeName,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
      builder: (context, state, child) {
        if (state.fullpath == AuthScreen.routeName ||
            state.fullpath == ForgotPasswordScreen.routeName ||
            state.fullpath == ExplenationScreen.routeName) {
          return child;
        }
        return PageShell(child: child);
      },
    )
  ],
);
