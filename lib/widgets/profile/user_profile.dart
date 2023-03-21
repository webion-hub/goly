import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/buttons/follow_button.dart';
import 'package:goly/widgets/form/buttons/main_outlined_button.dart';
import 'package:goly/widgets/layout/custom_divider.dart';
import 'package:goly/widgets/profile/user_goals.dart';
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
        Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: UserImage(imageUrl: user.photoUrl),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildStatColumn(user.following.length, 'Followings'),
                      buildStatColumn(user.followers.length, 'Followers'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  user.id == Utils.currentUid()
                      ? MainOutlinedButton(
                          fullWidth: true,
                          text: 'Edit profile',
                          icon: Icons.edit,
                          action: goToHandleProfileScreen,
                        )
                      : FollowButton(
                          isAlreadyFollowing:
                              user.followers.contains(Utils.currentUid()),
                          onPressed: () async {
                            await UserService.followUser(
                                Utils.currentUid(), user.id);
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.username,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(user.bio),
        ),
        const SizedBox(height: 10),
        const CustomDivider(),
        const SizedBox(height: 10),
        UserGoals(
          user: user,
        ),
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
            ),
          ),
        ),
      ],
    );
  }
}
