import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/settings.dart';

class UserModel {
  final String username;
  final String email;
  final String photoUrl;
  final String id;
  final String bio;
  final SettingsModel settings;
  final List<String> following;
  final List<String> followers;

  const UserModel({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.id,
    this.settings = SettingsModel.defaultSettings,
    this.bio = "",
    required this.following,
    required this.followers,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : username = json['username'],
      email = json['email'],
      photoUrl = json['photoUrl'],
      bio = json['bio'],
      id = json['id'],
      following = ((json['following'] as List<dynamic>).map((s) => (s.toString())).toList()),
      followers = ((json['followers'] as List<dynamic>).map((s) => (s.toString())).toList()),
      settings = SettingsModel.fromJson(json['settings']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    data['bio'] = bio;
    data['following'] = following.toList();
    data['followers'] = followers.toList();
    data['settings'] = settings.toJson();
    return data;
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel.fromJson(snapshot);
  }
}
