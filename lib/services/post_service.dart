import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:goly/models/post.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/comment_service.dart';
import 'package:goly/services/storage_service.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('posts');

class PostService extends Service {
  static Stream<QuerySnapshot<Object?>> getPostStream({
    required UserModel user,
  }) {
    return _collection
        .where('uid', whereIn: [...user.following, user.id])
        .orderBy('datePublished', descending: true)
        .snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getPostStreamByCategory({
    required String uid,
    required String category,
  }) {
    return _collection
        .where('uid', isEqualTo: uid)
        .where('category', isEqualTo: category)
        .snapshots();
  }

  static Future<String> uploadPost({
    required String description,
    required Uint8List file,
    required String uid,
    required String username,
    required String profImage,
    required String? category,
  }) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time
      PostModel post = PostModel(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        category: category,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  static Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Delete Post
  static Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      await CommentService.deleteCommentsFromPost(postId: postId);
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
