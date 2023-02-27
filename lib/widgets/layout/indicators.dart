import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buffering() {
  return const Center(child: CircularProgressIndicator());
}

Widget customBuffering() {
  return Center(
      child: Column(
    children: [
      Lottie.asset('assets/json/goal_loading.json'),
      const Text('Loading...'),
    ],
  ));
}
