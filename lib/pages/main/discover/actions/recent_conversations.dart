import 'package:flutter/material.dart';
import 'package:goly/components/cards/user_conversation_card.dart';

class RecentConversations extends StatelessWidget {
  static const routeName = '/recent-conversations';
  const RecentConversations({super.key});

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
