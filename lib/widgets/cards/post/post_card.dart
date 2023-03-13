import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/animations/like_animation.dart';
import 'package:goly/widgets/cards/post/action_post_card.dart';
import 'package:goly/widgets/cards/post/comments_number.dart';
import 'package:goly/widgets/cards/post/user_post_description.dart';
import 'package:goly/widgets/cards/post/user_section.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    var imageSection = GestureDetector(
      onDoubleTap: () {
        PostService.likePost(
          widget.post.postId,
          Utils.currentUid(),
          widget.post.likes,
        );
        setState(() {
          isLikeAnimating = true;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 487 / 451,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter,
                  image: NetworkImage(
                    widget.post.postUrl,
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(18)),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLikeAnimating ? 1 : 0,
            child: LikeAnimation(
              isAnimating: isLikeAnimating,
              duration: const Duration(
                milliseconds: 400,
              ),
              onEnd: () {
                setState(() {
                  isLikeAnimating = false;
                });
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      children: [
        UserSection(
          uid: widget.post.uid,
          postId: widget.post.postId,
          userImage: widget.post.profImage,
          username: widget.post.username,
          category: widget.post.category,
        ),
        //userSection,
        const SizedBox(height: 20),
        imageSection,
        const SizedBox(height: 20),
        ActionsPostCard(
          postId: widget.post.postId,
          likes: widget.post.likes,
        ),
        const SizedBox(height: 20),
        UserPostDescription(
          username: widget.post.username,
          description: widget.post.description,
          likes: widget.post.likes,
        ),
        const SizedBox(height: 10),
        CommentsNumber(postId: widget.post.postId),
        const SizedBox(height: 40),
      ],
    );
  }
}
