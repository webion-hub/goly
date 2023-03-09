import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/buttons/follow_button.dart';
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
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildStatColumn(20, 'Followings'),
            buildStatColumn(20, 'Followers'),
          ],
        ),
        const SizedBox(height: 20),
        user.id == Utils.currentUid()
            ? MainOutlinedButton(
                label: const Text('Edit profile'),
                icon: Icons.edit,
                action: goToHandleProfileScreen)
            : FollowButton(
                isAlreadyFollowing: true,
                onPressed: () {},
              ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
