class SettingsModel {
  final bool privateAccount;
  final bool privateGoalsByDefault;
  final bool privateRewardByDefault;
  final bool privateDescriptionsByDefault;

  static const defaultSettings = SettingsModel(
    privateAccount: false,
    privateDescriptionsByDefault: false,
    privateGoalsByDefault: false,
    privateRewardByDefault: false,
  );

  const SettingsModel({
    this.privateAccount = false,
    this.privateGoalsByDefault = true,
    this.privateRewardByDefault = true,
    this.privateDescriptionsByDefault = false,
  });

  SettingsModel.fromJson(Map<String, dynamic> json)
      : privateAccount = json['privateAccount'] as dynamic,
        privateGoalsByDefault = json['privateGoalsByDefault'] as dynamic,
        privateRewardByDefault = json['privateRewardByDefault'] as dynamic,
        privateDescriptionsByDefault =
            json['privateDescriptionsByDefault'] as dynamic;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['privateAccount'] = privateAccount;
    data['privateGoalsByDefault'] = privateGoalsByDefault;
    data['privateRewardByDefault'] = privateRewardByDefault;
    data['privateDescriptionsByDefault'] = privateDescriptionsByDefault;
    return data;
  }
}
