import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/app_bars/discover_app_bar.dart';
import 'package:goly/components/app_bars/goals_app_bar.dart';
import 'package:goly/components/app_bars/profile_app_bar.dart';
import 'package:goly/pages/main/discover/discover_page.dart';
import 'package:goly/pages/main/goals/goals_page.dart';
import 'package:goly/pages/main/profile/profile_page.dart';
import 'package:goly/utils/utils.dart';

class App extends StatefulWidget {
  static const routeName = '/home';
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final user = FirebaseAuth.instance.currentUser!;
  int pageIndex = 1;
  List<PreferredSizeWidget> appBarLists = const <PreferredSizeWidget>[
    DiscoverAppBar(),
    GoalsAppBar(),
    ProfileAppBar(),
  ];
  List<Widget> pageList = <Widget>[
    const DiscoverPage(),
    const GoalsPage(),
    ProfilePage(profileId: Utils.currentUid()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: ((value) {
          setState(() {
            pageIndex = value;
          });
        }),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_rounded),
            label: "Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: pageList,
      ),
    );
  }
}
