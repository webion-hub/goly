import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/providers/user_provider.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
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
    setState(() {
      _page = page;
    });
    String url = '/';
    switch (page) {
      case 0:
        url = DiscoverScreen.routeName;
        break;
      case 1:
        url = GoalsScreen.routeName;
        break;
      case 2:
        url = ProfileScreen.routeName;
    }
    GoRouter.of(context).go(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: CupertinoTabBar(
        border: Border.all(
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tips_and_updates,
              color: (_page == 0)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flag_rounded,
              color: (_page == 1)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
            label: "Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: (_page == 2)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
            label: "Profile",
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
