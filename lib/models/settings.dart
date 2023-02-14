class SettingsModel {
  bool privateAccount;
  bool privateGoalsByDefault;
  bool privateRewardByDefault;
  bool privateDescriptionsByDefault;


  SettingsModel({
    this.privateAccount = false,
    this.privateGoalsByDefault = true,
    this.privateRewardByDefault = true,
    this.privateDescriptionsByDefault = false,
  });

  SettingsModel.fromJson(Map<String, dynamic> json)
      : privateAccount = json['privateAccount'],
        privateGoalsByDefault = json['privateGoalsByDefault'],
        privateRewardByDefault = json['privateRewardByDefault'],
        privateDescriptionsByDefault = json['privateDescriptionsByDefault'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    
    data['privateAccount'] = privateGoalsByDefault;
    data['privateGoalsByDefault'] = privateRewardByDefault;
    data['privateRewardByDefault'] =
        privateRewardByDefault;
    data['privateDescriptionsByDefault'] = privateDescriptionsByDefault;

    return data;
  }
}
