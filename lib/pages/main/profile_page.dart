import 'package:flutter/material.dart';
import 'package:goly/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Constants.pagePadding,
      child: Container(
          child: Column(
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
            'Alessandro Dodi',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id ipsum ipsum. Fusce ac eleifend augue. Suspendisse potenti. Ut sed massa porttitor, pellentesque nulla sed, convallis turpis. ',
          ),
          ElevatedButton(
            onPressed: () {},
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
      )),
    );
  }
}
