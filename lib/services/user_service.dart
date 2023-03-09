import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:goly/models/user.dart';
import 'package:goly/utils/firebase.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('users');

class UserService extends Service {
  UserModel? user;
  static String get currentUid => firebaseAuth.currentUser!.uid;

  static Future<UserModel> fetchUser() async {
    DocumentSnapshot doc = await _collection.doc(currentUid).get();

    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  static Future updateProfile({required UserModel user}) async {
    final documentReferencer = _collection.doc(user.id);
    return await documentReferencer.set(user.toJson());
  }

  static Stream getUserStream({required String uid}) {
    return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
  }

  static Future<String> uploadUserImage(File image) async {
    String imageUrl = '';
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('$currentUid${p.extension(image.path)}');

    await ref.putFile(image).then((_) {
      ref.getDownloadURL().then((value) {
        imageUrl = value.toString();
      });
    });
    return imageUrl;
  }

  static Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];
      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> searchUsers(
      {required String searchText}) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where(
          'username',
          isGreaterThanOrEqualTo: searchText,
        )
        .get();
  }
}
