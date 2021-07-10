final String tableCategory = 'category';

class CategoryModel {
  final int? id;
  final String name;
  final String desc;
  final int? parentId;
  final bool isActive;
  final DateTime createdTime;
  final String createdBy;

  CategoryModel(
      {this.id,
      required this.name,
      required this.desc,
      this.parentId,
      this.isActive = true,
      required this.createdTime,
      required this.createdBy});

  CategoryModel copy({
    int? id,
    String? name,
    String? desc,
    int? parentId,
    bool? isActive,
    DateTime? createdTime,
    String? createdBy,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        parentId: parentId ?? this.parentId,
        isActive: isActive ?? this.isActive,
        createdTime: createdTime ?? this.createdTime,
        createdBy: this.createdBy,
      );

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        parentId: json["parentId"],
        isActive: json["isActive"] == 1,
        createdTime: DateTime.parse(json["createdTime"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "parentId": parentId,
        "isActive": isActive ? 1 : 0,
        "createdTime": createdTime.toIso8601String(),
        "createdBy": createdBy,
      };
}
