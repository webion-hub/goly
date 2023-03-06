import 'package:flutter/material.dart';
import 'package:goly/widgets/chat/messages.dart';
import 'package:goly/widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';
  final String userReceiver;
  const ChatScreen({super.key, required this.userReceiver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: Messages(userReceiver: userReceiver),
          ),
          NewMessage(userReceiver: userReceiver),
        ],
      ),
    );
  }
}
