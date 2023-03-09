class RecentConversationModel {
  final String uid;
  final String username;
  final String photoUrl;
  const RecentConversationModel({
    required this.uid,
    required this.username,
    required this.photoUrl,
  });

  RecentConversationModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        username = json['username'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['username'] = username;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
