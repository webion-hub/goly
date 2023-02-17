import 'dart:developer';


// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final CollectionReference _collection = _firestore.collection('goals');

class StepService extends Service {
  // static Future addStep({
  //   required String categoryName,
  //   required int goalIndex,
  //   required StepModel step,
  // }) async {
  //   // print(_collection.doc(Utils.currentUid())
  //   //     .collection('categories')
  //   //     .doc(categoryName).)
  //   return await _collection
  //       .doc(Utils.currentUid())
  //       .collection('categories')
  //       .doc(categoryName)
  //       .update ({
  //     'goals.$goalIndex[steps]': FieldValue.arrayUnion([step.toJson()]),
  //   });
  // }

  // static Future editStep({
  //   required String categoryName,
  //   required int goalIndex,
  //   required StepModel step,
  // }) async {
  //   return await _collection.doc().update(step.toJson());
  // }
}
