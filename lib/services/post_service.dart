import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('posts');

class PostService extends Service {
  static Stream<QuerySnapshot<Object?>> getPostStream() {
    return _collection.snapshots();
  }
}
