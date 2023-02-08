import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future:
                FirebaseFirestore.instance.collection('users').doc('PKhYVNZOFUXcJkNva7NWN4MEcs53').get(),
            builder: ((context, snapshot) => Text(snapshot.data!['username']))),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('dateTime', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
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