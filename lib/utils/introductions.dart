import 'package:flutter/material.dart';

class Introduction {
  String title;
  String description;
  IconData icon;
  Introduction({
    required this.title, 
    required this.description,
    required this.icon,
  });
}

class Introductions {
  static List<Introduction> welcome = [
    Introduction(
      title: "Welcome to Goly",
      description: "Welcome! Goly is the ultimate app for managing and sharing your goals",
      icon: Icons.waving_hand,
    ),
    Introduction(
      title: "Why Goly",
      description: "Welcome to our goal management and sharing app! With this app, you can easily set and track your goals, as well as share them with friends, family, or colleagues to keep yourself accountable and motivated. \n \n Whether you're working towards personal or professional goals, our app provides the tools and support you need to stay on track and achieve success.\n\n Let's get started!",
      icon: Icons.question_mark_rounded,
    ),
    Introduction(
      title: "How it works",
      description: "It's quite simple. These are the main things you need to know: \n\n - You can group goals into categories.\n - You can divide goals into steps \n - You can post your progress or your tips on a particular goal \n\n",
      icon: Icons.flag_rounded,
    ),
  ];
}
