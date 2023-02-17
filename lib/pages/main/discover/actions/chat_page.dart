import 'package:flutter/material.dart';
import 'package:goly/components/chat/messages.dart';
import 'package:goly/components/chat/new_message.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';
  final String userReceiver;
  const ChatPage({super.key, required this.userReceiver});

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
