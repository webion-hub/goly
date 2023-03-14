import 'package:go_router/go_router.dart';
import 'package:goly/screens/introductions/explenation_screen.dart';

final List<RouteBase> introductionPages = [
  GoRoute(
    path: ExplenationScreen.routeName,
    builder: (context, state) => const ExplenationScreen(),
  ),
];
