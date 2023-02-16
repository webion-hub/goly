import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/utils/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class GoalService extends Service {
  static Future addGoal(
      {required String categoryName, required GoalModel goal}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryName)
        .update({
      'goals': FieldValue.arrayUnion([goal.toJson()])
    });
  }

  static Future editGoal({required GoalModel goal}) async {
    return await _collection.doc().update(goal.toJson());
  }
}
