import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/app_bars/profile_app_bar.dart';
import 'package:goly/components/profile/user_profile.dart';
import 'package:goly/models/user.dart';
import 'package:goly/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  final String profileId;
  const ProfilePage({super.key, required this.profileId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: Constants.pagePadding,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.profileId)
                  .snapshots(),
          builder: (context, snapshot) {
            return FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.profileId)
                  .get(),
              builder: ((context, snapshot) {
                if (snapshot.data?.data() == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                UserModel user = UserModel.fromJson(
                    snapshot.data?.data() as Map<String, dynamic>);
                return UserProfile(user: user);
              }),
            );
          }
        ),
      ),
    );
  }
}
