import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/screens/main/feed/actions/comment_screen.dart';
import 'package:goly/services/comment_service.dart';

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
        onTap: () => GoRouter.of(context).push(CommentsScreen.routeName, extra: widget.postId),
        child: StreamBuilder(
            stream: CommentService.getCommentsStreamFromPost(postId: widget.postId),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              int numberOfComments = snapshot.data?.docs.length ?? 0;
              return numberOfComments == 0
                ? const SizedBox()
                : Text(
                    'View all $numberOfComments comments',
                    style: Theme.of(context).textTheme.bodySmall,
                  );
            }),
      ),
    );
  }
}
