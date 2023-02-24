import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/widgets/cards/post_card.dart';
import 'package:goly/widgets/layout/app_bars/discover_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DiscoverAppBar(),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: PostService.getPostStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customBuffering();
            }
            if (snapshot.data == null) {
              return const Text('Your feed is empty');
            }
            return Column(children: [
              ...?snapshot.data?.docs.map((e) => PostCard(
                    post: PostModel.fromJson(e.data() as Map<String, dynamic>),
                  ))
            ]);
          },
        ),
      ),
    );
  }
}
