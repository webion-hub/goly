import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firestore = FirebaseAuth.instance;

class FirebaseService extends Service {
  static Future signUpUser({
    required String email,
    required String password,
  }) async {
    return  await _firestore.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future logInUser({
    required String email,
    required String password,
  }) async {
    return await _firestore.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  
}
