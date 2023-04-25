import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/feed/actions/comment_screen.dart';
import 'package:goly/screens/main/feed/feed_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/screens/main/search/search_screen.dart';

final List<RouteBase> friendsPages = [
  GoRoute(
    path: FeedScreen.routeName,
    builder: (context, state) => const FeedScreen(),
  ),
  GoRoute(
    path: CommentsScreen.routeName,
    builder: (context, state) {
      return CommentsScreen(
        postId: state.extra.toString(),
      );
    },
  ),
  GoRoute(
    path: SearchScreen.routeName,
    builder: (context, state) => const SearchScreen(),
  ),
  GoRoute(
    path: ProfileScreen.otherUser,
    builder: (context, state) =>
        ProfileScreen(profileId: state.extra.toString()),
  ),
];

const List<String> friendsPagesRoute = [
  FeedScreen.routeName,
  CommentsScreen.routeName,
  SearchScreen.routeName,
  ProfileScreen.otherUser,
];
