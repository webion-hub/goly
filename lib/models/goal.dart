import 'package:goly/models/step.dart';

class GoalModel {
  int id;
  String name;
  String? description;
  String? reward;
  bool completed;
  bool privateGoal;
  bool privateDescription;
  bool privateReward;
  List<StepModel>? steps;

  GoalModel({
    required this.name,
    required this.id,
    this.description,
    this.steps,
    this.reward,
    this.completed = false,
    this.privateGoal = true,
    this.privateDescription = true,
    this.privateReward = true,
  });

  GoalModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        description = json['description'],
        reward = json['reward'],
        completed = json['completed'],
        steps = ((json['steps'] as List<dynamic>? ?? [])
            .map((s) => StepModel.fromJson(s))
            .toList()),
        privateGoal = json['privateGoal'],
        privateDescription = json['privateDescription'],
        privateReward = json['privateReward'] ?? false;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'description': description,
      'reward': reward,
      'completed': completed,
      'privateGoal': privateGoal,
      'steps': steps?.map((step) => step.toJson()).toList() ?? [],
      'privateDescription': privateDescription,
    };
  }
}
