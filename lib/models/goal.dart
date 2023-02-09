import 'package:goly/models/step.dart';

class GoalModel {
  String id;
  String title;
  String? description;
  bool? completed;
  bool private;
  bool privateDescription;
  List<StepModel>? steps;

  GoalModel({
    required this.id,
    required this.title,
    this.description,
    this.steps,
    this.completed = false,
    required this.private,
    required this.privateDescription,
  });

  GoalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        completed = json['completed'],
        private = json['private'],
        privateDescription = json['privateDescription']
        // steps = StepModel.fromJson(json['steps'],
        ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['private'] = private;
    data['privateDescription'] = privateDescription;
    return data;
  }
}
