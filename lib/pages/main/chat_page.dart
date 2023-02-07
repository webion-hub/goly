import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/components/chat/messages.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: const [
          Expanded(child: Messages()),
        ],
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chat/H2Zx0GlSrrBdaq7OBUWH/messages')
              .add({'text': 'Dummy text message'});
        },
      ),
    );
  }
}

// StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('chat/H2Zx0GlSrrBdaq7OBUWH/messages')
//             .snapshots(),
//         builder: (context, snapshot) =>
//             snapshot.connectionState == ConnectionState.waiting
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: ((context, index) => Container(
//                           padding: const EdgeInsets.all(8),
//                           child: Text(snapshot.data?.docs[index]['text']),
//                         )),
//                   ),
//       ),