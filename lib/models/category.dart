import 'package:goly/models/goal.dart';

class CategoryModel {
  String id;
  String name;
  String? description;
  List<GoalModel>? goals;
  bool private;
  bool privateDescription;

  CategoryModel({
    required this.id,
    required this.name,
    this.goals,
    required this.private,
    this.description,
    required this.privateDescription,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        // goals = ((json['goals'] as List<dynamic>? ?? [])
        //     .map((g) => GoalModel.fromJson(g))
        //     .toList()),
        private = json['private'],
        privateDescription = json['privateDescription'] ?? false;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'description': description,
      // 'goals': goals?.map((element) => element.toJson()) ?? [],
      'private': private,
      'privateDescription': privateDescription,
    };
  }
}
