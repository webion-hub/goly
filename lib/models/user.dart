import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? username;
  String? email;
  String? photoUrl;
  String? id;
  String? bio;
  Settings? settings;


  UserModel({this.username, this.email, this.photoUrl, this.id, this.bio, this.settings});
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    id = json['id'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    return data;
  }
}
