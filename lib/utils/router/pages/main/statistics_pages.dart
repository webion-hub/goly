import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/statistics/statistics_screen.dart';

final List<RouteBase> statisticsPages = [
  GoRoute(
      path: StatisticsScreen.routeName,
      builder: (context, state) {
        return const StatisticsScreen();
      }),
];

const List<String> statisticsPagesRoute = [
  StatisticsScreen.routeName,
];
