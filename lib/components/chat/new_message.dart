import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _eneteredMessage = '';
  void _sendMessage() {
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _eneteredMessage,
    });
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
