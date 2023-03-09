import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/friends/actions/comment_screen.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/animations/like_animation.dart';

class ActionsPostCard extends StatelessWidget {
  final String postId;
  final List<dynamic> likes;

  const ActionsPostCard({
    super.key,
    required this.postId,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.comment),
          onPressed: () {
            GoRouter.of(context).push(CommentsScreen.routeName, extra: postId);
          },
        ),
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: LikeAnimation(
            isAnimating: likes.contains(Utils.currentUid()),
            child: IconButton(
              icon: likes.contains(Utils.currentUid())
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                PostService.likePost(
                  postId,
                  Utils.currentUid(),
                  likes,
                );
              },
            ),
          ),
        )),
      ],
    );
  }
}
