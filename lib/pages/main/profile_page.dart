import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goly/components/app_bars/profile_app_bar.dart';
import 'package:goly/models/user.dart';
import 'package:goly/pages/auth/edit_profile.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/firebase.dart';
import 'package:goly/utils/utils.dart';

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
        child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(widget.profileId)
                .get(),
            builder: ((context, snapshot) =>  snapshot.data != null ? Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/webion-logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    snapshot.data!['username'],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id ipsum ipsum. Fusce ac eleifend augue. Suspendisse potenti. Ut sed massa porttitor, pellentesque nulla sed, convallis turpis. ',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => EditProfile(
                          uid: Utils.currentUid(),
                        ),
                      ));
                    },
                    child: const Text('Edit profile'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
            ): SizedBox(height: 0,) ) ,
          ),
 
      ),
    );
  }
}
