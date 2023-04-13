import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goly/models/category.dart';
import 'package:goly/screens/main/friends/friends_screen.dart';
import 'package:goly/screens/main/goals/goals_screen.dart';
import 'package:goly/screens/main/profile/profile_screen.dart';
import 'package:uuid/uuid.dart';

class Constants {
  static String appName = "Goly";
  static String youtubeAPiKey = 'AIzaSyAZWBqMHNjwcDZ7IDd15UDcOkSlXsAflDE';
  static String userImageDefault = 'https://firebasestorage.googleapis.com/v0/b/goly-app.appspot.com/o/user_image%2Fuser.jpeg?alt=media&token=3bb9a06b-fdde-42a7-aba0-1e570bed7899';

  static const pagePadding = EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0);
  static const webScreenSize = 600;
  static final List<Widget> homeScreenItems = [
    const FriendsScreen(),
    const GoalsScreen(),
    ProfileScreen(
      profileId: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];
  static IconData getLockerIcon({required bool private}) {
    return private ? Icons.lock_outline_rounded : Icons.lock_open_outlined;
  }

  static final List<CategoryModel> defaultCategories = [
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Financial',
      private: false,
      privateDescription: false,
    ),
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Career',
      private: false,
      privateDescription: false
    ),
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Spiritual',
      private: false,
      privateDescription: false
    ),
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Personal life',
      private: false,
      privateDescription: false
    ),
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Health & Fitness',
      private: false,
      privateDescription: false
    ),
    CategoryModel(
      id: const Uuid().v1(),
      name: 'Familial',
      private: false,
      privateDescription: false
    ),
  ];
}
