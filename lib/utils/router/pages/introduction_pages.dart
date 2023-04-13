import 'package:go_router/go_router.dart';
import 'package:goly/screens/introductions/explanation_screen.dart';

final List<RouteBase> introductionPages = [
  GoRoute(
    path: ExplanationScreen.routeName,
    builder: (context, state) => const ExplanationScreen(),
  ),
];
