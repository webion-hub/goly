import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/chat/message_bubble.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/layout/indicators.dart';

class Messages extends StatelessWidget {
  final String userReceiver;
  const Messages({super.key, required this.userReceiver});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(Utils.currentUid())
              .get(),
          builder: ((context, snapshot) => Text(
                snapshot.data != null ? snapshot.data!['username'] : '',
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('dateTime', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return buffering();
              }
              return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                reverse: true,
                itemBuilder: ((context, index) => MessageBubble(
                      text: snapshot.data?.docs[index]['text'],
                      isMe: snapshot.data?.docs[index]['userId'] ==
                          FirebaseAuth.instance.currentUser!.uid,
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
