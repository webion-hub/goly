import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/user.dart';
import 'package:goly/utils/firebase.dart';

class UserService extends Service {
  //get the authenticated uis
  String currentUid() {
    return firebaseAuth.currentUser!.uid;
  }
  //updates user profile in the Edit Profile Screen
  updateProfile(
      {File? image, String? username, String? bio, Settings? settings}) async {
    DocumentSnapshot doc = await usersRef.doc(currentUid()).get();
    var users = UserModel.fromJson(doc.data() as Map<String, dynamic>);
    users.username = username;
    users.bio = bio;
    // if (image != null) {
    //   users.photoUrl = await uploadImag(profilePic, image);
    // }
    await usersRef.doc(currentUid()).update({
      'username': username,
      'bio': bio,
      "photoUrl": users.photoUrl ?? '',
    });

    return true;
  }
}
