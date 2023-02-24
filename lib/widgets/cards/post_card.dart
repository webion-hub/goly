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
            ),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
    );

    var actions = Row(
      children: [
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
          const Text('142 likes'),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${post.username}: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: post.description,
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
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: const Text(
            'View all 120 comments',
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
