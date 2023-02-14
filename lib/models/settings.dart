class SettingsModel {
  bool? privateGoalsByDefault;
  bool? privateDescriptionsByDefault;
  bool? privateAccount;

  SettingsModel(
      {this.privateGoalsByDefault = true,
      this.privateDescriptionsByDefault = true,
      this.privateAccount = false});

  SettingsModel.fromJson(Map<String, dynamic> json)
      : privateGoalsByDefault = json['privateGoalsByDefault'],
        privateAccount = json['privateAccount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privateGoalsByDefault'] = privateGoalsByDefault ?? 'true';
    data['privateDescriptionsByDefault'] =
        privateDescriptionsByDefault ?? 'true';
    data['privateAccount'] = privateAccount ?? 'false';
    return data;
  }
}
