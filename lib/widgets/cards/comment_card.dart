import 'package:flutter/material.dart';
import 'package:goly/models/comment.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  final CommentModel comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              comment.profilePic,
            ),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${comment.name}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: comment.text,
                  style:  TextStyle(color: Theme.of(context).colorScheme.inverseSurface)
                ),
              ],
            ),
          ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                       comment.datePublished,
                      ),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400,),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}