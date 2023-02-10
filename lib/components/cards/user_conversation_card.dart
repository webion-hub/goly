import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/pages/main/chat_page.dart';

class UserConversationCard extends StatelessWidget {
  final String userName;
  final String userPicture;
  const UserConversationCard(
      {super.key, required this.userName, required this.userPicture});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => const ChatPage(
              userReceiver: 'FHl2G7ywdCbabRTzL5TTIF9OmMD2',
            ),
          )),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(
                      userPicture,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(userName),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
