import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/pages/introductions/introduction_page.dart';
import 'package:goly/pages/main/home_page.dart';
import 'package:goly/pages/settings/settings.dart';
import 'package:goly/utils/constants.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final user = FirebaseAuth.instance.currentUser!;
  int pageIndex = 0;
  List<Widget> pageList = const <Widget>[
    HomePage(),
    IntroductionPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        actions: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: ((value) {
          setState(() {
            pageIndex = value;
          });
        } ),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.tips_and_updates), label: "Discover"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Profile"),
        ],
        
      ),
      body: pageList[pageIndex],
    );
  }
}
