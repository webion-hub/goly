import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/comment.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class CommentService extends Service {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getCommentsStreamFromPost({required String postId}) {
    return FirebaseFirestore
      .instance.collection('posts')
      .doc(postId)
      .collection('comments')
      .snapshots();
  }

  static Future<String> postComment(String postId, String text, String uid, String name, String profilePic) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set(CommentModel(
          id: commentId,
          datePublished: DateTime.now().toUtc(),
          name: name,
          profilePic: profilePic,
          text: text,
          uid: uid,
        ).toJson());
        res = 'success';
      } else {
        res = "Please enter text";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  static Future<String> deleteCommentsFromPost({required String postId}) async {
    String res = "Some error occurred";
    try {
      var snap = await _firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .get();
      for (var doc in snap.docs) {
        await doc.reference.delete();
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
