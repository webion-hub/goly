import 'package:flutter/material.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/layout/app_bars/profile_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/profile/user_profile.dart';
import 'package:goly/models/user.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/me';
  static const otherUser = '/user';
  final String profileId;
  const ProfileScreen({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileId == Utils.currentUid() ? const ProfileAppBar() : AppBar(),
      body: StreamBuilder(
        stream: UserService.getUserStream(uid: profileId),
        builder: (context, snapshot) {
          if (snapshot.data?.data() == null) {
            return buffering();
          }
          UserModel user = UserModel.fromJson(snapshot.data?.data() as Map<String, dynamic>);
          return UserProfile(user: user);
        },
      ),
    );
  }
}
