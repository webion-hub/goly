import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/user.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/layout/indicators.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  bool isShowUsers = false;
  void goToProfile(String id) {
    final router = GoRouter.of(context);
    if (id == Utils.currentUid()) {
      router.go(ProfileScreen.routeName);
    } else {
      router.push(ProfileScreen.otherUser, extra: id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Form(
          child: TextFormField(
            autofocus: true,
            controller: searchController,
            decoration: const InputDecoration(labelText: 'Search for a user...'),
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
              future: UserService.searchUsers(searchText: searchController.text),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return customBuffering();
                }
                List<UserModel> users = snapshot.data!.docs
                    .map(
                      (e) => UserModel.fromJson(e.data()),
                    )
                    .toList();
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => goToProfile(users[index].id),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(users[index].photoUrl),
                          radius: 16,
                        ),
                        title: Text(users[index].username),
                      ),
                    );
                  },
                );
              },
            )
          : const Text(''),
    );
  }
}
