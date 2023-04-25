import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/models/report.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection('report');

class ReportService extends Service {
  static Future sendMessage({required ReportModel r}) async {
    return _collection.add(r.toMap());
  }
}
