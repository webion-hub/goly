import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/discover/discover_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/utils/constants.dart';

class PageShell extends StatefulWidget {
  final Widget child;
  const PageShell({Key? key, required this.child}) : super(key: key);

  @override
  State<PageShell> createState() => _PageShellState();
}

class _PageShellState extends State<PageShell> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
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
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      // PageView(
      //   children: Constants.homeScreenItems,
      //   controller: pageController,
      //   onPageChanged: onPageChanged,
      // ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates,
            color: (_page == 0) ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary,
            ),
            label: "Discover",
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_rounded,
            color: (_page == 1) ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary,
            ),
            label: "Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded,
            color: (_page == 2) ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.secondary,
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