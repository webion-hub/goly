import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/goal.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/utils/utils.dart';

import 'package:darq/darq.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class GoalService extends Service {
  static Future addGoal({
    required String categoryId,
    required GoalModel goal,
  }) async {
    var numberOfGoals = await CategoryService.getNumberofGoals(categoryId: categoryId);

    return await _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(numberOfGoals.toString())
      .set(goal.toJson());
  }

  static Future editGoal({required String categoryId, required GoalModel goal}) async {
    return await _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(goal.id.toString())
      .update(goal.toJson());
  }

  static Future deleteGoal({required String categoryId, required int goalId}) async {
    return await _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(goalId.toString())
      .delete();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getGoalStreamFromId({required String categoryId, required int goalId}) {
    return _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(goalId.toString())
      .snapshots();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getGoalFromId({required String categoryId, required int goalId}) async {
    return await _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(goalId.toString())
      .get();
  }

  static Future<int> getNumberOfSteps({required String categoryId, required int goalId}) async {
    return _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc(categoryId)
      .collection('goals')
      .doc(goalId.toString())
      .get()
      .then((value) => GoalModel.fromJson(value.data()!).steps?.length ?? 0);
  }

  static Future toggleGoalCompleted({required String categoryId, required GoalModel goal, required bool value}) async {
    goal.completed = value;
    return await GoalService.editGoal(categoryId: categoryId, goal: goal);
  }

  static double getPercentageOfCompletition(GoalModel goal) {
    if (goal.steps == null || goal.steps!.isEmpty) {
      return goal.completed ? 1 : 0;
    }

    final totalSteps = goal.steps?.length ?? 0;
    final stepCount = goal.steps!.where((e) => e.completed).count();

    return stepCount / totalSteps;
  }
}
