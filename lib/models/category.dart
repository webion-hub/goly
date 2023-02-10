import 'package:goly/models/goal.dart';

class CategoryModel {
  String name;
  String? description;
  List<GoalModel>? goals;
  bool private;
  
  CategoryModel({required this.name, this.goals, required this.private, required this.description});

    CategoryModel.fromJson(Map<String, dynamic> json):
    name = json['name'],
    goals = json['goals'],
    private = json['private'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['goals'] = goals;
    data['private'] = private;
    return data;
  }
}