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
        .doc(category.name)
        .set(category.toJson());
  }

  ///Edit a new category to firestore under the collection categories
  static Future editCategory({required String oldCategoryName, required CategoryModel category}) async {
    deleteCategory(categoryId: oldCategoryName);
    addCategory(category: category);
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
  static Stream<QuerySnapshot<Map<String,dynamic>>> getCategoryGoals({required String categoryId}) {
    return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .collection('goals')
        .snapshots();
  }
}
