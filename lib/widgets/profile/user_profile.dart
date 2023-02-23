import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/widgets/form/buttons/main_outlined_button.dart';
import 'package:goly/widgets/profile/user_image.dart';
import 'package:goly/models/user.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    void goToHandleProfileScreen() {
      GoRouter.of(context).push(HandleProfileScreen.routeNameEdit, extra: user);
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
