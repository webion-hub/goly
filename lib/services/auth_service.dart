import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goly/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService extends Service {
  static Future signUpUser({required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future signInWithGoogle() async {
    final gUser = await GoogleSignIn().signIn();
    if(gUser == null) {
      return null;
    }
    final gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: gAuth.idToken,
      accessToken: gAuth.accessToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future logInUser({required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(documentSnapshot);
  }
}
