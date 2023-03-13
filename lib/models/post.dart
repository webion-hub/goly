import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goly/utils/utils.dart';

class PostModel {
  final String description;
  final String uid;
  final String username;
  final List<dynamic> likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final String? category;

  const PostModel({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    this.category,
    required this.profImage,
  });

  static PostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        category: snapshot['category']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage,
        'category': category,
      };

  PostModel.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        uid = json["uid"],
        likes = (json['likes'] as List<dynamic>),
        postId = json["postId"],
        datePublished = Utils.dateTimeToTimeStamp(json['datePublished']),
        username = json["username"],
        postUrl = json['postUrl'],
        profImage = json['profImage'],
        category = json['category'];
}
