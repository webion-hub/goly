import 'package:flutter/material.dart';
import 'package:goly/widgets/profile/user_image.dart';

class UserSection extends StatelessWidget {
  final String userImage;
  final String username;
  final String? goal;
  const UserSection(
      {super.key, required this.userImage, required this.username, this.goal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            UserImage(imageUrl: userImage, width: 50),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 5),
                goal != null ? Text(goal!) : const SizedBox(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
