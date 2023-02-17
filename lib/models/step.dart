class StepModel {
  String name;
  String? reward;
  bool completed;
  bool privateGoal;
  bool privateReward;

  StepModel({
    required this.name,
    this.reward,
    this.completed = false,
    this.privateGoal = false,
    this.privateReward = false,
  });

  StepModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        reward = json['reward'] ?? "",
        completed = json['completed'],
        privateGoal = json['privateGoal'],
        privateReward = json['privateReward'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['reward'] = reward ?? "";
    data['completed'] = completed;
    data['privateGoal'] = privateGoal;
    data['privateReward'] = privateReward;

    return data;
  }
}
