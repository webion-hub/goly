import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/search/search_screen.dart';

final List<RouteBase> searchPages = [
  GoRoute(
    path: SearchScreen.routeName,
    builder: (context, state) => const SearchScreen(),
  ),
];
