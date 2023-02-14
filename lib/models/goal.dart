class GoalModel {
  String id;
  String title;
  String? description;
  String? reward;
  bool completed;
  bool private;
  bool privateDescription;
  List<GoalModel>? steps;

  GoalModel({
    required this.id,
    required this.title,
    this.description,
    this.steps,
    this.reward,
    this.completed = false,
    this.private = true,
    this.privateDescription = true,
  });

  GoalModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        completed = json['completed'],
        private = json['private'],
        privateDescription = json['privateDescription'];

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
