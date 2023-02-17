import 'package:goly/models/step.dart';

class GoalModel {
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
        description = json['description'],
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
      'description': description,
      'completed': completed,
      'privateGoal': privateGoal,
      'steps': steps?.map((step) => step.toJson()) ?? [],
      'privateDescription': privateDescription,
    };
  }
}
