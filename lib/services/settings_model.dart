import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/settings.dart';
import 'package:goly/utils/firebase.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('settings');

class SettingsService extends Service {
  SettingsModel? settings;
  static String get currentUid => firebaseAuth.currentUser!.uid;

  static Future updateSettings({required SettingsModel settings}) async {
    final documentReferencer = _collection.doc(currentUid);
    return await documentReferencer.set(settings.toJson());
  }
}
