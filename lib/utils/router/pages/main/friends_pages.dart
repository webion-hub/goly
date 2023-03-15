import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/comment_screen.dart';
import 'package:goly/screens/main/friends/friends_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/screens/main/search/search_screen.dart';

final List<RouteBase> friendsPages = [
  GoRoute(
    path: FriendsScreen.routeName,
    builder: (context, state) => const FriendsScreen(),
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
  FriendsScreen.routeName,
  CommentsScreen.routeName,
  SearchScreen.routeName,
  ProfileScreen.otherUser,
];
