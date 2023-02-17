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
    required String categoryName,
    required GoalModel goal,
  }) async {
    var numberOfGoals = 
        await CategoryService.getNumberofGoals(categoryId: categoryName);
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryName)
        .collection('goals')
        .doc(numberOfGoals.toString())
        .set(goal.toJson());
  }

  // static Future editGoal({required GoalModel goal}) async {
  //   return await _collection.doc().update(goal.toJson());
  // }
  static Future editGoal(
      {required String categoryName, required GoalModel goal}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryName)
        .update({
      'goals': FieldValue.arrayUnion([goal.toJson()])
    });
  }

  static Future deleteGoal(
      {required String categoryName, required GoalModel goal}) async {
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryName)
        .update({
      'goals': FieldValue.arrayUnion([goal.toJson()])
    });
  }

  static void addStepToGoal(
      {required GoalModel goal, required StepModel step}) {
    // if (goal.steps == null) {
    //   goal.steps = [];
    // }
    // goal.steps!.add(step);
  }
}
