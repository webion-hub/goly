import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? content;
  String? senderUid;
  String? messageId;
  Timestamp? time;
  Message({this.content, this.senderUid, this.messageId});

  Message.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    senderUid = json['senderUid'];
    messageId = json['messageId'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['content'] = content;
    data['senderUid'] = senderUid;
    data['messageId'] = messageId;
    data['time'] = time;
    return data;
  }
}
