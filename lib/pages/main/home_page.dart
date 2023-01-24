import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Center(
          //   child: Text(
          //     "Hello ${user.email!}",
          //     style: const TextStyle(color: Colors.green),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () => FirebaseAuth.instance.signOut(),
          //   child: const Text('logout'),
          // ),
        ],
      );
  }
}