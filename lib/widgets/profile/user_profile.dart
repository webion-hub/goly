import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/buttons/main_outlined_button.dart';
import 'package:goly/widgets/profile/user_image.dart';
import 'package:goly/models/user.dart';
import 'package:goly/screens/auth/handle_profile_screen.dart';
import 'package:goly/utils/utils.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    void goToHandleProfileScreen() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => HandleProfileScreen(
          uid: Utils.currentUid(),
          user: user,
        ),
      ));
    }

    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: UserImage(imageUrl: user.photoUrl),
        ),
        const SizedBox(height: 20),
        Text(
          user.username,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(user.bio),
        MainOutlinedButton(
            label: const Text('Edit profile'),
            icon: Icons.edit,
            action: goToHandleProfileScreen),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}
