import 'package:flutter/material.dart';
import 'package:goly/components/chat/messages.dart';
import 'package:goly/components/chat/new_message.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}