import 'package:goly/models/goal.dart';

class CategoryModel {
  String name;
  String? description;
  List<GoalModel>? goals;
  bool private;
  bool privateDescription;

  CategoryModel({
    required this.name,
    this.goals,
    required this.private,
    this.description,
    required this.privateDescription,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
      description = json['description'],
        //goals = json['goals'],
        private = json['private'],
        privateDescription = json['privateDescription'] ?? false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    //data['goals'] = goals.forEach((element) {element.toJson()});
    data['private'] = private;
    data['privateDescription'] = privateDescription;
    return data;
  }
}
