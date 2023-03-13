import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/add_post_screen.dart';

final List<RouteBase> addPages = [
  GoRoute(
    path: AddPostScreen.routeName,
    builder: (context, state) => const AddPostScreen(),
  ),
];

const List<String> addPagesRoute = [
  AddPostScreen.routeName,
];
