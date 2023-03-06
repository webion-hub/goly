import 'package:flutter/material.dart';
import 'package:goly/widgets/cards/user_conversation_card.dart';

class RecentConversationsScreen extends StatelessWidget {
  static const routeName = '/recent-conversations';
  const RecentConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: const [
          UserConversationCard(userName: 'Alle dodi', userPicture: ''),
        ],
      ),
    );
  }
}
