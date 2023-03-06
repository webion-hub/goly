import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/add_post_screen.dart';
import 'package:goly/screens/main/chat/recent_conversations_screen.dart';
import 'package:goly/screens/main/friends/actions/comment_screen.dart';
import 'package:goly/screens/main/friends/actions/search/search_screen.dart';
import 'package:goly/screens/main/friends/friends_Screen.dart';

final List<RouteBase> friendsPages = [
  GoRoute(
    path: FriendsScreen.routeName,
    builder: (context, state) => const FriendsScreen(),
  ),
  GoRoute(
    path: RecentConversationsScreen.routeName,
    builder: (context, state) => const RecentConversationsScreen(),
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
