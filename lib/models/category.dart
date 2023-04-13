class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final bool private;
  final bool privateDescription;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.private,
    this.description,
    required this.privateDescription,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      private = json['private'],
      privateDescription = json['privateDescription'] ?? false;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'description': description,
      'private': private,
      'privateDescription': privateDescription,
    };
  }
}
