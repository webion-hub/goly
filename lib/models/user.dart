class UserModel {
  String? username;
  String? email;
  String? photoUrl;
  String? id;

  UserModel({this.username, this.email, this.photoUrl, this.id});
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data['id'] = id;
    return data;
  }
}
