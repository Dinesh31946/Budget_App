import 'package:budget_app/model/categoryModel.dart';
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
          FOREIGN KEY(parentId) REFERENCES $tableCategory (id) ON DELETE NO ACTION ON UPDATE NO ACTION
        )
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
    final List<Map<String, Object?>> categories = await db.query("category");
    return categories.map((e) => CategoryModel.fromMap(e)).toList();
  }

  // //get category id and name data
  // Future<List<CategoryModel>> getName() async {
  //   final db = await instance.database;
  //   final List<Map<String, Object?>> categories =
  //       await db.query("SELECT id, name FROM $tableCategory");
  //   return categories.map((e) => CategoryModel.fromMap(e)).toList();
  // }

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

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
