class StepModel {
  int id;
  String name;
  String? reward;
  bool completed;
  bool privateStep;
  bool privateReward;

  StepModel({
    required this.id,
    required this.name,
    this.reward,
    this.completed = false,
    this.privateStep = false,
    this.privateReward = false,
  });

  StepModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        reward = json['reward'],
        completed = json['completed'],
        privateStep = json['privateStep'],
        privateReward = json['privateReward'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['reward'] = reward;
    data['completed'] = completed;
    data['privateStep'] = privateStep;
    data['privateReward'] = privateReward;

    return data;
  }
}
