import 'package:flutter/material.dart';
import 'package:goly/components/app_bars/discover_app_bar.dart';

class DiscoverPage extends StatelessWidget {
  static const routeName = '/discover';
  const DiscoverPage({super.key});

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
