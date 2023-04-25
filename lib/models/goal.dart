import 'package:goly/models/step.dart';
import 'package:goly/utils/utils.dart';

class GoalModel {
  final int id;
  final String name;
  final String? description;
  final String? reward;
  bool completed;
  final bool privateGoal;
  final bool privateDescription;
  final bool privateReward;
  final DateTime? expirationDate;
  final List<StepModel>? steps;
  final int priority;

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
    this.priority = 1,
    this.expirationDate,
    });

  GoalModel.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      id = json['id'],
      description = json['description'],
      reward = json['reward'],
      completed = json['completed'],
      steps = ((json['steps'] as List<dynamic>? ?? []).map((s) => StepModel.fromJson(s)).toList()),
      privateGoal = json['privateGoal'],
      privateDescription = json['privateDescription'],
      priority = json['priority'],
      expirationDate = Utils.dateTimeToTimeStamp(json['expirationDate']),
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
      'expirationDate': expirationDate,
      'priority': priority,
    };
  }
}
