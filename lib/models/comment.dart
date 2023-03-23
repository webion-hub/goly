import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/utils/utils.dart';

class CommentModel {
  final String id;
  final DateTime datePublished;
  final String name;
  final String profilePic;
  final String text;
  final String uid;

  const CommentModel({
    required this.id,
    required this.datePublished,
    required this.name,
    required this.profilePic,
    required this.text,
    required this.uid,
  });

  CommentModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        datePublished = Utils.dateTimeToTimeStamp(json['datePublished']),
        name = json['name'],
        profilePic = json['profilePic'],
        text = json['text'],
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "datePublished": datePublished,
        "name": name,
        "profilePic": profilePic,
        "text": text,
        "uid": uid,
      };

  static CommentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CommentModel.fromJson(snapshot);
  }
}
