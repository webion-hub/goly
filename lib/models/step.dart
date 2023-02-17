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
    this.privateGoal = true,
    this.privateReward = true,
  });

  StepModel.fromJson(Map<String, dynamic> json)
       : name = json['name'],
        completed = json['completed'],
        privateGoal = json['privateGoal'],
        privateReward = json['privateReward'] ?? false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['completed'] = completed;
    data['privateGoal'] = privateGoal;
    return data;
  }
}
