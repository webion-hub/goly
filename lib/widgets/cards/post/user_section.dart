import 'package:flutter/material.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/profile/user_image.dart';

class UserSection extends StatelessWidget {
  final String uid;
  final String postId;
  final String userImage;
  final String username;
  final String? goal;
  const UserSection({
    super.key,
    required this.userImage,
    required this.username,
    this.goal,
    required this.uid,
    required this.postId,
  });

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
            uid == Utils.currentUid()
                ? Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                PostService.deletePost(postId);
                                                // remove the dialog box
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
