import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String uid;
  final String username;
  final dynamic likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;
  final String? goal;

  const PostModel({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    this.goal,
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
        goal: snapshot['goal']);
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
        'goal': goal,
      };

  PostModel.fromJson(Map<String, dynamic> json)
      : description = json["description"],
        uid = json["uid"],
        likes = json["likes"],
        postId = json["postId"],
        datePublished = DateTime
          .parse((json["datePublished"] as Timestamp)
          .toDate()
          .toString()),
        username = json["username"],
        postUrl = json['postUrl'],
        profImage = json['profImage'],
        goal = json['goal'];
}
