import 'package:go_router/go_router.dart';
import 'package:goly/models/user.dart';
import 'package:goly/screens/main/profile/actions/settings_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/utils.dart';

final List<RouteBase> profilePages = [
  GoRoute(
    path: ProfileScreen.routeName,
    builder: (context, state) => ProfileScreen(profileId: Utils.currentUid()),
  ),
  GoRoute(
    path: ProfileScreen.otherUser,
    builder: (context, state) =>
        ProfileScreen(profileId: state.extra.toString()),
  ),
  GoRoute(
    path: HandleProfileScreen.routeNameSetUp,
    builder: (context, state) => HandleProfileScreen(uid: Utils.currentUid()),
  ),
  GoRoute(
      path: HandleProfileScreen.routeNameEdit,
      builder: (context, state) {
        UserModel user = state.extra as UserModel;
        return HandleProfileScreen(
          uid: Utils.currentUid(),
          user: user,
        );
      }),
  GoRoute(
    path: SettingsScreen.routeName,
    builder: (context, state) => const SettingsScreen(),
  ),
];
const List<String> profilePagesRoute = [
  ProfileScreen.routeName,
  HandleProfileScreen.routeNameEdit,
  SettingsScreen.routeName
];
