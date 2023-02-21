import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/app_bars/profile_app_bar.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/profile/user_profile.dart';
import 'package:goly/models/user.dart';
import 'package:goly/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  final String profileId;
  const ProfileScreen({super.key, required this.profileId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: Constants.pagePadding,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(profileId)
                .snapshots(),
            builder: (context, snapshot) {
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(profileId)
                    .get(),
                builder: ((context, snapshot) {
                  if (snapshot.data?.data() == null) {
                    return buffering();
                  }
                  UserModel user = UserModel.fromJson(
                      snapshot.data?.data() as Map<String, dynamic>);
                  return UserProfile(user: user);
                }),
              );
            }),
      ),
    );
  }
}
