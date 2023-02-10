import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String content;
  String senderUid;
  Timestamp time;
  Message({required this.content, required this.senderUid, required this.time,});

  Message.fromJson(Map<String, dynamic> json):
    content = json['content'],
    senderUid = json['senderUid'],
    time = json['time'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['senderUid'] = senderUid;
    data['time'] = time;
    return data;
  }
}
