import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/message.dart';
import 'package:goly/utils/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('chat');

class MessageService extends Service {
  static Stream<DocumentSnapshot<Object?>> getRecentConversations() {
    return _collection.doc(Utils.currentUid()).snapshots();
  }

  static Future sendMessage(
      {required MessageModel m, required String receiverId}) async {
    return FirebaseFirestore.instance
        .collection('chat')
        .doc(m.senderUid)
        .collection(receiverId)
        .add(m.toJson());
  }
}
