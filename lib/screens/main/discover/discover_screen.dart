import 'package:flutter/material.dart';
import 'package:goly/widgets/layout/app_bars/discover_app_bar.dart';
import 'package:lottie/lottie.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = '/dicover';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DiscoverAppBar(),
      body: Center(
        child: Lottie.asset('assets/json/goal_loading.json'),
      ),
    );
  }
}
