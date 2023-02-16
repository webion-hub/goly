import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/category.dart';
import 'package:goly/utils/utils.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('goals');

class CategoryService extends Service {
  static Future addCategory({required CategoryModel category}) async {

    return await _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(category.name)
        .set(
          category.toJson(),
        );
  }

  static Future editCategory({required CategoryModel category}) async {
    return await _collection
      .doc(Utils.currentUid())
      .collection('categories')
      .doc('eWdXda9XtZ4UlFmfS3DG')
      .update(category.toJson());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getCategoriesStream({String? userId})  {
    return _collection
        .doc(userId ?? Utils.currentUid())
        .collection('categories')
        .doc()
        .snapshots();
        
  }
  static Future getCategoriesFuture({String? userId}) async {
    return _collection
        .doc(userId ?? Utils.currentUid())
        .collection('categories')
        .snapshots();
  }

  static Future deleteCategories({required String categoryId}) async {
      return _collection
        .doc(Utils.currentUid())
        .collection('categories')
        .doc(categoryId)
        .delete();

  }

}
