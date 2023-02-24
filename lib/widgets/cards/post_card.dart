import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/widgets/profile/user_image.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {

    var userSection = Row(
      children: [
        UserImage(imageUrl: post.profImage, width: 50),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.username, style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 5),
            post.goal != null ? Text(post.goal!) : const SizedBox(),
          ],
        ),
      ],
    );

    var imageSection = GestureDetector(
      onDoubleTap: () {},
      child: AspectRatio(
        aspectRatio: 487 / 451,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            alignment: FractionalOffset.topCenter,
            image: NetworkImage(
              post.postUrl,
            ),
          )),
        ),
      ),
    );

    var actions = Row(children: [
      IconButton(
        icon: const Icon(Icons.message),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {},
      ),
    ]);
    
    return Column(
      children: [
        userSection,
        const SizedBox(height: 20),
        imageSection,
        const SizedBox(height: 20),
        actions,
        const SizedBox(height: 40),
      ],
    );
  }
}
