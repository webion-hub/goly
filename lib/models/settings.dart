class SettingsModel  {
  bool? privateGoalsByDefault;
  bool? privateAccount;

  SettingsModel({this.privateGoalsByDefault, this.privateAccount});

    SettingsModel.fromJson(Map<String, dynamic> json) {
    privateGoalsByDefault = json['privateGoalsByDefault'];
    privateAccount = json['privateAccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privateGoalsByDefault'] = privateGoalsByDefault;
    data['privateAccount'] = privateAccount;
    return data;
  }
}