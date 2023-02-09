import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/user.dart';
import 'package:goly/utils/firebase.dart';

class UserService extends Service {

  UserModel? user;
  //get the authenticated uis


  String get currentUid => firebaseAuth.currentUser!.uid;
  
  Future<UserModel> fetchUser() async  {
    DocumentSnapshot doc = await usersRef
      .doc(currentUid)
      .get();

    final data = doc.data() as Map<String, dynamic>;

    return UserModel.fromJson(data);
  }

  //updates user profile in the Edit Profile Screen
  // updateProfile({
  //   File? image,
  //   String? username,
  //   String? bio,
  //   Settings? settings,
  // }) async {

  //   if(user != null) {
  //     return false; 
  //   }
    
  //   user?.username = username;
  //   user?.bio = bio;

  //   await usersRef.doc(currentUid).update({
  //     'username': username,
  //     'bio': bio,
  //     "photoUrl": user?.photoUrl ?? '',
  //   });

  //   return true;
  // }
}

final userService = UserService();

