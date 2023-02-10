import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  final String userReceiver;
  const NewMessage({super.key, required this.userReceiver});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _eneteredMessage = '';
  final FocusNode textFocus = FocusNode();
  var messageController = TextEditingController(text: '');
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _eneteredMessage,
      'dateTime': Timestamp.now(),
      'userId': user!.uid,
    });
    messageController.text  = '';
    FocusScope.of(context).autofocus(textFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: textFocus,
              autofocus: true,
              controller: messageController,
              onSubmitted: (_) =>_sendMessage(),
              decoration: const InputDecoration(labelText: 'Send a message...'),
              onChanged: ((value) {
                setState(() {
                  _eneteredMessage = value;
                });
              }),
            ),
          ),
          IconButton(
              onPressed: _eneteredMessage.trim().isEmpty ? null : _sendMessage,
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
