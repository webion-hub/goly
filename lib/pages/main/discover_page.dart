import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  static const routeName = '/discover';
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('discover'),),
    );
  }
}