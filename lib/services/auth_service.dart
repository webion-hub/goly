import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firestore = FirebaseAuth.instance;

class AuthService extends Service {
  static Future<String> signUpUser({required String email, required String password}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _firestore.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }
    return res;
  }

  static Future<String> logInUser({required String email, required String password}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _firestore.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      res = e.message.toString();
    }
    return res;
  }
}
