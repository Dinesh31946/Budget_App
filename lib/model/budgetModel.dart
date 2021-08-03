final String tableBudget = "budget";

class BudgetModel {
  int? id;
  String name;
  String? desc;
  final String startDate;
  final String endDate;
  double? income;
  double? expense;
  final bool isActive;
  final DateTime createdTime;
  final String createdBy;

  BudgetModel(
      {this.id,
      required this.name,
      this.desc,
      required this.startDate,
      required this.endDate,
      this.income = 0.0,
      this.expense = 0.0,
      this.isActive = true,
      required this.createdTime,
      required this.createdBy});

  BudgetModel copy({
    int? id,
    String? name,
    String? desc,
    String? startDate,
    String? endDate,
    double? income,
    double? expense,
    bool? isActive,
    DateTime? createdTime,
    String? createdBy,
  }) =>
      BudgetModel(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        income: income ?? this.income,
        expense: expense ?? this.expense,
        isActive: isActive ?? this.isActive,
        createdTime: createdTime ?? this.createdTime,
        createdBy: this.createdBy,
      );

  factory BudgetModel.fromMap(Map<String, dynamic> json) => BudgetModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        income: json["income"],
        expense: json["expense"],
        isActive: json["isActive"] == 1,
        createdTime: DateTime.parse(json["createdTime"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "income": income,
        "startDate": startDate,
        "endDate": endDate,
        "expense": expense,
        "isActive": isActive ? 1 : 0,
        "createdTime": createdTime.toIso8601String(),
        "createdBy": createdBy,
      };
}
