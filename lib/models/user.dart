import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/utils/constants.dart';

class UserModel {
  String username;
  String email;
  String photoUrl;
  String id;
  String? bio;
  Settings? settings;

  UserModel({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.id,
    this.bio,
    this.settings,
  });

  UserModel.fromJson(Map<String, dynamic> json):
    username = json['username'],
    email = json['email'],
    photoUrl = json['photoUrl'] ?? Constants.userImageDefault,
    bio = json['bio'] ?? '',
    id = json['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    return data;
  }
}
