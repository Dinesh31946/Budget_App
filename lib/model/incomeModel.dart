final String tableIncome = 'income';

class IncomeModel {
  int? id;
  String name;
  String? desc;
  final bool isActive;
  final DateTime createdTime;
  final String createdBy;

  IncomeModel(
      {this.id,
      required this.name,
      this.desc,
      this.isActive = true,
      required this.createdTime,
      required this.createdBy});

  IncomeModel copy({
    int? id,
    String? name,
    String? desc,
    bool? isActive,
    DateTime? createdTime,
    String? createdBy,
  }) =>
      IncomeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        isActive: isActive ?? this.isActive,
        createdTime: createdTime ?? this.createdTime,
        createdBy: this.createdBy,
      );

  factory IncomeModel.fromMap(Map<String, dynamic> json) => IncomeModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        isActive: json["isActive"] == 1,
        createdTime: DateTime.parse(json["createdTime"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "isActive": isActive ? 1 : 0,
        "createdTime": createdTime.toIso8601String(),
        "createdBy": createdBy,
      };
}
