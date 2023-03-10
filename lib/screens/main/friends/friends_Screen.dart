import 'package:flutter/material.dart';
import 'package:goly/models/post.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/post_service.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/cards/post/post_card.dart';
import 'package:goly/widgets/layout/app_bars/friends_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const FriendsAppBar(),
        body: SafeArea(
          child: StreamBuilder(
              stream: UserService.getUserStream(uid: Utils.currentUid()),
              builder: (context, userSnapshot) {
                if (userSnapshot.hasData == false) {
                  return buffering();
                }

                UserModel user = UserModel.fromJson(
                    userSnapshot.data?.data() as Map<String, dynamic>);
                return StreamBuilder(
                  stream: PostService.getPostStream(user: user),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SingleChildScrollView(child: customBuffering());
                    }
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text(
                        'Your feed is empty. Start following some people',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ));
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
