import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/widgets/cards/post/post_card.dart';
import 'package:goly/widgets/layout/app_bars/friends_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const FriendsAppBar(),
          body: FutureBuilder(
              future: UserService.fetchUser(),
              builder: (context, user) {
                if (user.hasData == false) {
                  return buffering();
                }
                return StreamBuilder(
                  stream:
                      PostService.getPostStream(user: (user.data as UserModel)),
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
                );
              }),
        ));
  }
}
