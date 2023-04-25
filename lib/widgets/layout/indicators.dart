import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buffering() {
  return const Center(child: CircularProgressIndicator());
}

Widget customBuffering() {
  return SafeArea(
    child: Center(
        child: Column(
      children: [
        Lottie.asset('assets/json/goal_loading.json', width: 300),
        const Text('Loading...'),
      ],
    )),
  );
}
