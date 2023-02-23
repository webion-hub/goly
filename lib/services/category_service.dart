import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/category.dart';
import 'package:goly/utils/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class CategoryService extends Service {
  ///Add a new category to firestore under the collection categories
  static Future addCategory({required CategoryModel category}) async {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(category.id)
        .set(category.toJson());
  }

  ///Edit a new category to firestore under the collection categories
  static Future editCategory({required CategoryModel category}) async {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(category.id)
        .update(category.toJson());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getCategoriesStream(
      {String? userId}) {
    return _collection
        .doc(userId ?? Utils.currentUid())
        .collection('categories')
        .doc()
        .snapshots();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getCategoryStream(
      {String? userId, required String categoryId}) {
    return _collection
        .doc(userId ?? Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .snapshots();
  }

  static Future deleteCategory({required String categoryId}) async {
    await deleteCategoryGoals(categoryId: categoryId);
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .delete();
  }

  static Future deleteCategoryGoals({required String categoryId}) async {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .doc()
        .delete();
  }

  static Future<int> getNumberofGoals({required String categoryId}) async {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .get()
        .then((value) => value.size);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCategoryGoalsStream(
      {required String categoryId}) {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .snapshots();
  }
  static Future<QuerySnapshot<Map<String, dynamic>>> getCategoryGoals(
      {required String categoryId}) async{
    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .get();
  }

  static Future getCategoryById({required String categoryId}) async {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .get()
        .then((value) => value);
  }

  // static Future<double> getPercentageOfCompletition(
  //     {required String categoryId}) async {
  //   // CategoryModel? category;
  //   // await getCategoryById(categoryId: categoryId).then((value) {
  //   //   category = CategoryModel.fromJson(value.data()!);
  //   // });
  //   List<CategoryModel> goals;
  //   await getCategoryGoals(categoryId: categoryId).then((value) {
  //     value.docs.forEach((element) {goals.add(GoalModel.fromJson(element.))});
  //   });
  // }
}
