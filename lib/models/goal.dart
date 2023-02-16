class GoalModel {
  String title;
  String? description;
  String? reward;
  bool completed;
  bool privateGoal;
  bool privateDescription;
  bool privateReward;
  List<GoalModel>? steps;

  GoalModel({
    required this.title,
    this.description,
    this.steps,
    this.reward,
    this.completed = false,
    this.privateGoal = true,
    this.privateDescription = true,
    this.privateReward = true,
  });

  GoalModel.fromJson(Map<String, dynamic> json)
      //: id = json['id'],
       : title = json['title'],
        description = json['description'],
        completed = json['completed'],
        privateGoal = json['privateGoal'],
        privateDescription = json['privateDescription'],
        privateReward = json['privateReward'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['privateGoal'] = privateGoal;
    data['privateDescription'] = privateDescription;
    return data;
  }
}
