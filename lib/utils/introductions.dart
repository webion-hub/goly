import 'package:flutter/material.dart';

class Introduction {
  String title;
  String description;
  IconData icon;
  Introduction(
      {required this.title, required this.description, required this.icon});
}

class Introductions {
  static List<Introduction> welcome = [
    Introduction(
      title: "Welcome to Goly",
      description: "Welcome to the app! This is a description of how it works.",
      icon: Icons.waving_hand,
    ),
    Introduction(
      title: "Why Goly",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra in massa a aliquam. Integer tincidunt enim et lectus varius, a vehicula urna volutpat. Praesent placerat leo sit amet lacus varius, quis congue est elementum.",
      icon: Icons.waving_hand,
    ),
    Introduction(
      title: "How it works",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra in massa a aliquam. Integer tincidunt enim et lectus varius, a vehicula urna volutpat. Praesent placerat leo sit amet lacus varius, quis congue est elementum.",
      icon: Icons.settings,
    ),
  ];
}
