class StepModel {
  String name;
  String? reward;
  bool completed;
  bool privateStep;
  bool privateReward;

  StepModel({
    required this.name,
    this.reward,
    this.completed = false,
    this.privateStep = false,
    this.privateReward = false,
  });

  StepModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        reward = json['reward'] ?? "",
        completed = json['completed'],
        privateStep = json['privateStep'],
        privateReward = json['privateReward'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['reward'] = reward ?? "";
    data['completed'] = completed;
    data['privateStep'] = privateStep;
    data['privateReward'] = privateReward;

    return data;
  }
}
