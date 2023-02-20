import 'package:goly/models/settings.dart';
import 'package:goly/utils/constants.dart';

class UserModel {
  String username;
  String email;
  String photoUrl;
  String id;
  String bio;
  SettingsModel settings;

  UserModel({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.id,
    this.settings = const SettingsModel(
        privateAccount: false,
        privateDescriptionsByDefault: false,
        privateGoalsByDefault: false,
        privateRewardByDefault: false),
    this.bio = "",
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        photoUrl = json['photoUrl'] ?? Constants.userImageDefault,
        bio = json['bio'] ?? '',
        id = json['id'],
        settings = SettingsModel.fromJson(json['settings']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    data['bio'] = bio;
    data['settings'] = settings.toJson();
    return data;
  }
}
