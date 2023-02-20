import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/settings.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/firebase.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('users');

class SettingsService extends Service {
  SettingsModel? settings;
  static String get currentUid => firebaseAuth.currentUser!.uid;

  static Future updateSettings({
    bool? privateAccount,
    bool? privateGoalsByDefault,
    bool? privateRewardByDefault,
    bool? privateDescriptionsByDefault,
  }) async {
    final documentReferencer = _collection.doc(currentUid);
    SettingsModel currentSettings = await getCurrentSettings();
    SettingsModel newSettings = SettingsModel(
      privateAccount: privateAccount ?? currentSettings.privateAccount,
      privateGoalsByDefault:
          privateGoalsByDefault ?? currentSettings.privateGoalsByDefault,
      privateRewardByDefault:
          privateRewardByDefault ?? currentSettings.privateRewardByDefault,
      privateDescriptionsByDefault: privateDescriptionsByDefault ??
          currentSettings.privateDescriptionsByDefault,
    );
    return await documentReferencer.update({'settings': newSettings.toJson()});
  }

  static Future<SettingsModel> getCurrentSettings() async {
    UserModel u = await UserService.fetchUser();
    return u.settings;
  }
}
