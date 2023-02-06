import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: const Text('This works'),
            )),
      ),
    );
  }
}
