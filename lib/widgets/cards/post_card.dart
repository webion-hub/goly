import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/post.dart';
import 'package:goly/screens/main/discover/actions/comment_screen.dart';
import 'package:goly/services/comment_service.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/animations/like_animation.dart';
import 'package:goly/widgets/profile/user_image.dart';

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
    var userSection = Row(
      children: [
        UserImage(imageUrl: widget.post.profImage, width: 50),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.post.username,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 5),
            widget.post.goal != null
                ? Text(widget.post.goal!)
                : const SizedBox(),
          ],
        ),
      ],
    );

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

    var actions = Row(
      children: [
        IconButton(
          icon: const Icon(Icons.comment),
          onPressed: () {
            GoRouter.of(context)
                .push(CommentsScreen.routeName, extra: widget.post.postId);
          },
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
        LikeAnimation(
          isAnimating: widget.post.likes.contains(Utils.currentUid()),
          child: IconButton(
            icon: widget.post.likes.contains(Utils.currentUid())
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              PostService.likePost(
                widget.post.postId,
                Utils.currentUid(),
                widget.post.likes,
              );
            },
          ),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        )),
      ],
    );

    var userDescription = SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.post.likes.length} likes'),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.post.username}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: widget.post.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Column(
      children: [
        userSection,
        const SizedBox(height: 20),
        imageSection,
        const SizedBox(height: 20),
        actions,
        const SizedBox(height: 20),
        userDescription,
        const SizedBox(height: 10),
        CommentsNumber(postId: widget.post.postId),
        const SizedBox(height: 40),
      ],
    );
  }
}

class CommentsNumber extends StatefulWidget {
  final String postId;
  const CommentsNumber({super.key, required this.postId});

  @override
  State<CommentsNumber> createState() => _CommentsNumberState();
}

class _CommentsNumberState extends State<CommentsNumber> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => GoRouter.of(context)
            .push(CommentsScreen.routeName, extra: widget.postId),
        child: StreamBuilder(
            stream:
                CommentService.getCommentsStreamFromPost(postId: widget.postId),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              int numberOfComments = snapshot.data?.docs.length ?? 0;
              return Text(
                'View all $numberOfComments comments',
                style: Theme.of(context).textTheme.bodySmall,
              );
            }),
      ),
    );
  }
}
