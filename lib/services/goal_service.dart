import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/goal.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class GoalService extends Service {
  static Future addGoal({required GoalModel goal}) async {
    return await _collection
      .doc()
      .set(goal.toJson());
  }

  static Future editGoal({required GoalModel goal}) async {
    return await _collection
      .doc()
      .update(goal.toJson());
  }


}
