import 'package:go_router/go_router.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/responsive/page_shell.dart';
import 'package:goly/screens/auth/auth_screen.dart';
import 'package:goly/screens/auth/forgot_password_screen.dart';
import 'package:goly/screens/introductions/explenation_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/goal_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
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
            // if (FirebaseAuth.instance.currentUser != null) {
            //   return DiscoverScreen.routeName;
            // } else {
            //   return AuthScreen.routeName;
            // }
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
              GoalModel goal = extras['goal'] as GoalModel;

              return GoalScreen(
                goal: goal,
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
