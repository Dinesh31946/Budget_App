import 'package:budget_app/model/budgetModel.dart';
import 'package:budget_app/model/categoryModel.dart';
import 'package:budget_app/model/incomeModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB();
  static final DB instance = DB._init();

  static Database? _database;

  DB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('budget.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $tableCategory(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          desc TEXT NOT NULL,
          `parentId` INTEGER,
          isActive BOOLEAN NOT NULL,
          createdTime DATETIME DEFAULT (cast(strftime('%s','now') as int)),
          createdBy TEXT NOT NULL,
          FOREIGN KEY(parentId) REFERENCES $tableCategory (id) ON DELETE CASCADE ON UPDATE CASCADE
        );
        ''');

    await db.execute('''
        CREATE TABLE $tableIncome(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          desc TEXT,
          isActive BOOLEAN NOT NULL,
          createdTime DATETIME DEFAULT (cast(strftime('%s','now') as int)),
          createdBy TEXT NOT NULL
        );
      ''');

    await db.execute('''
        CREATE TABLE $tableBudget(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          desc TEXT,
          startDate DATETIME,
          endDate DATETIME,
          income DOUBLE,
          expense DOUBLE,
          isActive BOOLEAN NOT NULL,
          createdTime DATETIME DEFAULT (cast(strftime('%s','now') as int)),
          createdBy TEXT NOT NULL
        );
      ''');
  }

  Future _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute("PRAGMA foreign_keys = ON");
  }

  //Custom Category Functions
  Future<bool> insertCategory(CategoryModel categoryModel) async {
    final db = await instance.database;
    db.insert("category", categoryModel.toMap());
    return true;
  }

  Future<List<CategoryModel>> getCategory() async {
    final db = await instance.database;
    // final List<Map<String, Object?>> categories = await db.query("category");
    final List<Map<String, Object?>> categories =
        await db.rawQuery("SELECT * FROM category WHERE parentId IS NULL");
    return categories.map((e) => CategoryModel.fromMap(e)).toList();
  }

  // Future<List<CategoryModel>> getSubCategory() async {
  //   final db = await instance.database;
  //   final List<Map<String, Object?>> subCategory =
  //       await db.query("$tableCategory WHERE parentId is NOT NULL");
  //   return subCategory.map((e) => CategoryModel.fromMap(e)).toList();
  // }

  Future<List<CategoryModel>> getSubCategory(int index) async {
    final db = await instance.database;
    final List<Map<String, Object?>> subCategory =
        await db.rawQuery("SELECT * FROM category WHERE parentId = $index");
    return subCategory.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<int> updateCategory(CategoryModel categoryModel, int id) async {
    final db = await instance.database;

    return db.update(
      tableCategory,
      categoryModel.toMap(),
      where: 'id = ?',
      whereArgs: [categoryModel.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCategory,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Custom Income CRUD Methods
  Future<bool> insertIncome(IncomeModel incomeModel) async {
    final db = await instance.database;
    db.insert(tableIncome, incomeModel.toMap());
    return true;
  }

  Future<List<IncomeModel>> getIncome() async {
    final db = await instance.database;
    final List<Map<String, Object?>> income = await db.query(tableIncome);
    return income.map((e) => IncomeModel.fromMap(e)).toList();
  }

  Future<int> updateIncome(IncomeModel incomeModel, int id) async {
    final db = await instance.database;

    return db.update(
      tableIncome,
      incomeModel.toMap(),
      where: 'id = ?',
      whereArgs: [incomeModel.id],
    );
  }

  Future<int> deleteIncome(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableIncome,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Custom Budget CRUD Methods
  Future<bool> insertBudget(BudgetModel budgetModel) async {
    final db = await instance.database;
    db.insert(tableBudget, budgetModel.toMap());
    return true;
  }

  Future<List<BudgetModel>> getBudget() async {
    final db = await instance.database;
    final List<Map<String, Object?>> budgets = await db.query(tableBudget);
    return budgets.map((e) => BudgetModel.fromMap(e)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
