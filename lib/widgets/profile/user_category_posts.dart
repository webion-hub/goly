import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/widgets/cards/post/post_card.dart';
import 'package:goly/widgets/layout/indicators.dart';

class UserCategoryPosts extends StatelessWidget {
  const UserCategoryPosts({
    super.key,
    required this.uid,
    required this.categoryName,
  });

  final String uid;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          PostService.getPostStreamByCategory(uid: uid, category: categoryName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SingleChildScrollView(child: buffering());
        }
        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(''),
          );
        }
        return Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Posts',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ...snapshot.data!.docs.map(
              (e) => PostCard(
                post: PostModel.fromJson(e.data() as Map<String, dynamic>),
              ),
            )
          ],
        );
      },
    );
  }
}
