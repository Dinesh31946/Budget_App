import 'package:budget_app/model/categoryModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, "budget.db"),
      onCreate: (database, version) async {
        await database.execute('''
        CREATE TABLE $tableCategory(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          FOREIGN KEY (parentId) REFERENCES $tableCategory (id) ON DELETE CASCADE ON UPDATE CASCADE,
          createdTime DATETIME DEFAULT (cast(strftime('%s','now') as int))
        )
        ''');
      },
      version: 1,
    );
  }

  //Custom Category Functions
  Future<bool> insertCategory(CategoryModel categoryModel) async {
    final Database db = await initDB();
    db.insert("Categories", categoryModel.toMap());
    return true;
  }

  Future<List<CategoryModel>> getCategory() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> categories = await db.query("Categories");
    return categories.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<int> updateCategory(CategoryModel categoryModel) async {
    final Database db = await initDB();

    return db.update(
      tableCategory,
      categoryModel.toMap(),
      where: 'id = ?',
      whereArgs: [categoryModel.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final Database db = await initDB();

    return await db.delete(
      tableCategory,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final Database db = await initDB();

    db.close();
  }
}
