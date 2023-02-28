import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/discover/actions/add_post_screen.dart';
import 'package:goly/screens/main/discover/actions/recent_conversations_screen.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';

final List<RouteBase> discoverPages = [

        GoRoute(
          path: DiscoverScreen.routeName,
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: RecentConversationsScreen.routeName,
          builder: (context, state) => const RecentConversationsScreen(),
        ),
        GoRoute(
          path: AddPostScreen.routeName,
          builder: (context, state) => const AddPostScreen(),
        ),
];