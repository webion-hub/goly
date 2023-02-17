import 'package:flutter/material.dart';
import 'package:goly/widgets/app_bars/discover_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = '/discover';
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DiscoverAppBar(),
      body: Center(
        child: Text('discover'),
      ),
    );
  }
}
