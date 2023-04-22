import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/feed/feed_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
import 'package:goly/services/auth_service.dart';
import 'package:goly/services/user_service.dart';
class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            onPressed: () async {
              setState(() {
                _isSigningIn = true;
              });
              
              AuthService.signInWithGoogle()
                .then((value) async {
                  final router = GoRouter.of(context);
                  final isUserSet = await UserService.isUserSet(uid: FirebaseAuth.instance.currentUser!.uid);
                  if(isUserSet) {
                    router.go(FeedScreen.routeName);
                  } else {
                    router.go(HandleProfileScreen.routeNameSetUp);
                  }
                });

              setState(() {
                _isSigningIn = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(
                    image: AssetImage("assets/images/google_logo.png"),
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Use your google account instead',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}