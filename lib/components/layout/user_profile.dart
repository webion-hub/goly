import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/buttons/main_outlined_button.dart';
import 'package:goly/models/user.dart';
import 'package:goly/pages/auth/edit_profile_page.dart';
import 'package:goly/utils/utils.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    void goToEditProfilePage() {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => EditProfilePage(
          uid: Utils.currentUid(),
          user: user,
        ),
      ));
    }

    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              user.photoUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          user.username,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user.bio ?? "",
        ),
        MainOutlinedButton(
            label: const Text('Edit profile'),
            icon: Icons.edit,
            action: goToEditProfilePage),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
