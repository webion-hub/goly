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
}
