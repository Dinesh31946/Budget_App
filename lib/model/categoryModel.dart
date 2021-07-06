final String tableCategory = 'category';

class CategoryModel {
  final int? id;
  final String name;
  final int? parentId;
  final DateTime createdTime;

  CategoryModel(
      {this.id, required this.name, this.parentId, required this.createdTime});

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
      id: json["id"],
      name: json["title"],
      parentId: json["parentId"],
      createdTime: DateTime.parse(json["createdTime"]));

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": name,
        "parentId": parentId,
        "createdTime": createdTime.toIso8601String()
      };
}
