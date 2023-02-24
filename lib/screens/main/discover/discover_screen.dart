import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/widgets/cards/post_card.dart';
import 'package:goly/widgets/layout/app_bars/discover_app_bar.dart';
import 'package:lottie/lottie.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel post = PostModel(
      datePublished: DateTime.now(),
      description: 'I finished vipassana',
      goal: 'Complete vipassana',
      postId: '76110980-b41e-11ed-bcd1-ad5aefa714ec',
      likes: [],
      postUrl:
          'https://firebasestorage.googleapis.com/v0/b/goly-app.appspot.com/o/posts%2FxsNltyX8QQfk3gSCNSWwBzhqoRk2%2F74e61e10-b41e-11ed-bcd1-ad5aefa714ec?alt=media&token=98298c89-629e-4196-b90e-5c4ba1f2f345',
      profImage:
          'https://firebasestorage.googleapis.com/v0/b/goly-app.appspot.com/o/user_image%2FxsNltyX8QQfk3gSCNSWwBzhqoRk2.jpg?alt=media&token=b6f48321-cab2-4ebd-bda8-379dc07bcfc9',
      uid: 'xsNltyX8QQfk3gSCNSWwBzhqoRk2',
      username: 'Alle Dodi',
    );

    return Scaffold(
      appBar: const DiscoverAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          PostCard(post: post),
          PostCard(post: post),
          PostCard(post: post),
          PostCard(post: post),
          PostCard(post: post),
        ],
      )),
    );
  }
}
