import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/add_post_screen.dart';
import 'package:goly/screens/main/friends/actions/comment_screen.dart';
import 'package:goly/screens/main/friends/friends_screen.dart';

final List<RouteBase> friendsPages = [
  GoRoute(
    path: FriendsScreen.routeName,
    builder: (context, state) => const FriendsScreen(),
  ),
  GoRoute(
    path: AddPostScreen.routeName,
    builder: (context, state) => const AddPostScreen(),
  ),
  GoRoute(
    path: CommentsScreen.routeName,
    builder: (context, state) {
      return CommentsScreen(
        postId: state.extra.toString(),
      );
    },
  ),
];

const List<String> friendsPagesRoute = [
  FriendsScreen.routeName,
  AddPostScreen.routeName,
  CommentsScreen.routeName
];
