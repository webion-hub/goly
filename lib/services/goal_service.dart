import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/models/step.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class GoalService extends Service {
  static Future addGoal({
    required String categoryId,
    required GoalModel goal,
  }) async {
    var numberOfGoals =
        await CategoryService.getNumberofGoals(categoryId: categoryId);
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc(numberOfGoals.toString())
        .set(goal.toJson());
  }

  // static Future editGoal({required GoalModel goal}) async {
  //   return await _collection.doc().update(goal.toJson());
  // }
  static Future editGoal(
      {required String categoryId, required GoalModel goal}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc(goal.id.toString())
        .update(goal.toJson());
  }

  static Future deleteGoal(
      {required String categoryId, required GoalModel goal}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc(goal.id.toString())
        .delete();
  }

  static Future addStepToGoal(
      {required String categoryId,
      required int goalId,
      required StepModel step}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc(goalId.toString())
        .update({
      'steps': FieldValue.arrayUnion([step.toJson()])
    });
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getGoalFromId(
      {required String categoryId, required int goalId}) {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc(goalId.toString())
        .snapshots();
  }
}
