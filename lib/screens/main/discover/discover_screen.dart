import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/widgets/cards/post/post_card.dart';
import 'package:goly/widgets/layout/app_bars/discover_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const DiscoverAppBar(),
          body: TabBarView(
            children: [
              StreamBuilder(
                stream: PostService.getPostStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return customBuffering();
                  }
                  if (snapshot.data == null) {
                    return const Text('Your feed is empty');
                  }
                  return ListView.builder(
                    padding: Constants.pagePadding,
                    itemBuilder: ((context, index) {
                      return PostCard(
                        post: PostModel.fromJson(snapshot.data?.docs[index]
                            .data() as Map<String, dynamic>),
                      );
                    }),
                    itemCount: snapshot.data!.size,
                  );
                },
              ),
              const Icon(Icons.book),
            ],
          ),
        ));
  }
}
