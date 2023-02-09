class StepModel {
  String? title;
  String? description;
  bool? completed;
  bool? private;
  
  StepModel({String? title, String? description, bool? completed});

    StepModel.fromJson(Map<String, dynamic> json):
    title = json['title'],
    description = json['description'],
    completed = json['completed'],
    private = json['private'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['completed'] = completed;
    data['private'] = private;
    return data;
  }
}