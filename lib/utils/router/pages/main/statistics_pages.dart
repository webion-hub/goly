import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/goals/actions/statistics_screen.dart';

final List<RouteBase> statisticsPages = [
  GoRoute(
      path: StatisticScreen.routeName,
      builder: (context, state) {
        return const StatisticScreen();
      }),
];

const List<String> statisticsPagesRoute = [
  StatisticScreen.routeName,
];
