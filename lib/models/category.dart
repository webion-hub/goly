import 'package:goly/models/goal.dart';

class CategoryModel {
  String name;
  String? description;
  List<GoalModel>? goals;
  bool private;

  CategoryModel(
      {required this.name,
      this.goals,
      required this.private,
      this.description});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        //goals = json['goals'],
        private = json['private'];

  Map<String, dynamic> toJson() {
    
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    //data['goals'] = goals.forEach((element) {element.toJson()});
    data['private'] = private;
    return data;
  }
}
