import 'package:goly/utils/utils.dart';

class StepModel {
  final int id;
  final String name;
  final String? reward;
  bool completed;
  final bool privateStep;
  final bool privateReward;
  final DateTime? expirationDate;

  StepModel({
    required this.id,
    required this.name,
    this.reward,
    this.completed = false,
    this.privateStep = false,
    this.privateReward = false,
    this.expirationDate,
  });

  StepModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        reward = json['reward'],
        completed = json['completed'],
        privateStep = json['privateStep'],
        expirationDate = Utils.dateTimeToTimeStamp(json['expirationDate']),
        privateReward = json['privateReward'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['reward'] = reward;
    data['completed'] = completed;
    data['privateStep'] = privateStep;
    data['expirationDate'] = expirationDate;
    data['privateReward'] = privateReward;

    return data;
  }
}
