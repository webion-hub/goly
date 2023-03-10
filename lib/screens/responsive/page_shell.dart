import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/providers/user_provider.dart';
import 'package:goly/screens/main/search/search_screen.dart';
import 'package:goly/screens/main/friends/friends_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/router/pages/friends_pages.dart';
import 'package:goly/utils/router/pages/goal_pages.dart';
import 'package:goly/utils/router/pages/profile_pages.dart';
import 'package:provider/provider.dart';

class PageShell extends StatefulWidget {
  final Widget child;
  const PageShell({Key? key, required this.child}) : super(key: key);

  @override
  State<PageShell> createState() => _PageShellState();
}

class _PageShellState extends State<PageShell> {
  int _page = 0;
  @override
  void initState() {
    super.initState();
    addData();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  addData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  void navigationTapped(int page) {
    List<String> pagesRoute = [
      FriendsScreen.routeName,
      SearchScreen.routeName,
      GoalsScreen.routeName,
      ProfileScreen.routeName
    ];

    GoRouter.of(context).go(pagesRoute[page]);
  }

  Color getColor(List<String> paths) {
    if (paths.any((element) => element == GoRouter.of(context).location)) {
      return Theme.of(context).colorScheme.primary;
    }
    return Theme.of(context).colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigation = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      child: Container(
        color: Theme.of(context).hoverColor,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CupertinoTabBar(
            inactiveColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            border: Border.all(style: BorderStyle.none),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.diversity_3_rounded,
                    color: getColor(friendsPagesRoute)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    color: getColor([SearchScreen.routeName])),
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.flag_rounded, color: getColor(goalsPagesRouter)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded,
                    color: getColor(profilePagesRoute)),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: bottomNavigation,
    );
  }
}
