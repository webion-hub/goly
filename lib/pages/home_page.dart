import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.tips_and_updates), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "User")
      ]),
      body: Column(
        children: [
          Center(
            child: Text(
              "Hello ${user.email!}",
              style: const TextStyle(color: Colors.green),
            ),
          ),
          ElevatedButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            child: const Text('logout'),
          ),
        ],
      ),
    );
  }
}
