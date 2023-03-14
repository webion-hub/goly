import 'package:go_router/go_router.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/goal_screen.dart';
import 'package:goly/screens/main/goals/actions/goal/handle_goal_screen.dart';
import 'package:goly/screens/main/goals/actions/step/handle_step_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';

final List<RouteBase> goalPages = [
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
];

const List<String> goalsPagesRouter = [
  GoalsScreen.routeName,
  HandleGoalScreen.routeNameAdd,
  HandleCategoryScreen.routeNameAdd,
  HandleCategoryScreen.routeNameEdit,
  CategoryScreen.routeName,
  GoalScreen.routeName,
  HandleGoalScreen.routeNameEdit,
  CategoryScreen.routeName,
  HandleStepScreen.routeNameAdd,
  HandleStepScreen.routeNameEdit
];
