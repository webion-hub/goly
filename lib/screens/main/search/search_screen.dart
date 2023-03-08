import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/user.dart';
import 'package:goly/models/video_collection.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/services/videos_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/cards/video_card.dart';
import 'package:goly/widgets/layout/indicators.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Form(
            child: TextFormField(
              controller: searchController,
              decoration:
                  const InputDecoration(labelText: 'Search for a user...'),
              onChanged: (String _) {
                setState(() {
                  isShowUsers = true;
                });
              },
            ),
          ),
        ),
        body: isShowUsers
            ? FutureBuilder(
                future:
                    UserService.searchUsers(searchText: searchController.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return customBuffering();
                  }
                  List<UserModel> users = snapshot.data!.docs
                      .map((e) => UserModel.fromJson(e.data()))
                      .toList();
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => GoRouter.of(context).push(
                            ProfileScreen.routeName,
                            extra: Utils.currentUid()),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(users[index].photoUrl),
                            radius: 16,
                          ),
                          title: Text(
                            users[index].username,
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : SingleChildScrollView(
                child: FutureBuilder<VideoCollection>(
                    future:
                        VideoService.getVideosFromSearch(search: 'meditation'),
                    builder: (context, snapshot) {
                      var thumbnails = snapshot.data?.getThumnailInfo();
                      return Column(
                        children: thumbnails
                                ?.map((e) => VideoCard(video: e))
                                .toList() ??
                            [const SizedBox()],
                      );
                    }),
              ));
  }
}
