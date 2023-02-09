import 'package:goly/models/step.dart';

class GoalModel {
  String uid;
  String title;
  String? description;
  bool completed;
  bool private;
  bool privateDescription; 
  List<StepModel>? steps;

  GoalModel({
    required this.uid,
    required this.title,
    this.description,
    this.steps,
    required this.completed,
    required this.private,
    required this.privateDescription
  });


  GoalModel.fromJson(Map<String, dynamic> json):
    uid = json['uid'],
    title = json['title'],
    description = json['description'],
    completed = json['completed'],
    private = json['private'],
    privateDescription = json['privateDescription']
  ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['private'] = private;
    data['privateDescription'] = privateDescription;
    return data;
  }
}
