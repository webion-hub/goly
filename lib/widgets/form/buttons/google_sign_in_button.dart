import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/feed/feed_screen.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';
import 'package:goly/services/auth_service.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
class GoogleSignInButton extends StatefulWidget {
  final bool logIn;
  const GoogleSignInButton({super.key, required this.logIn});

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
        ? buffering()
        : SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).scaffoldBackgroundColor),
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
                
                await AuthService.signInWithGoogle()
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
                  children: <Widget>[
                    const Image(
                      image: AssetImage("assets/images/google_logo.png"),
                      height: 28.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.logIn ? 'Log in with Google' : 'Sign up with Google',
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.inverseSurface.withAlpha(200),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
    );
  }
}