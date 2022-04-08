import 'dart:async';

import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mtodox/model/category.dart';
import 'package:mtodox/model/task.dart';

class TodoDatabase {
  Database? _dataBase;
  static TodoDatabase instance = TodoDatabase._init();

  TodoDatabase._init();

  Future<Database> get dataBase async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await openDatabase(
      join(await getDatabasesPath(), "todo.db"),
      onCreate: createDB,
      version: 1,
    );
    return _dataBase!;
  }

  Future createDB(Database db, int version) async {
    const nameType = "TEXT NOT NULL";
    const description = "TEXT";
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const parentIDType = "INTEGER ";
    await db.execute('''CREATE TABLE ${TodoFields.tableTodo} (
      ${TodoFields.id} $idType , 
      ${TodoFields.name} $nameType,
      ${TodoFields.description} $description,
      ${TodoFields.parentID} $parentIDType

    )''');
  }

  Future<Category> createCategory(Category category) async {
    final Database db = await instance.dataBase;
    //! in case of
    //createDB(db, 1);
    //await db.execute("DROP TABLE ${TodoFields.tableTodo} ");

    final id = await db.insert(TodoFields.tableTodo, category.toJson());
    return category.copy(id: id);
  }

  Future<Task> createTask(Task task) async {
    final Database db = await instance.dataBase;

    final id = await db.insert(TodoFields.tableTodo, task.toJson());
    return task.copy(id: id);
  }

  Future<void> deleteTask(int id) async {
    final Database db = await instance.dataBase;
    db.delete(
      TodoFields.tableTodo,
      where: '${TodoFields.id} = ? ',
      whereArgs: [id],
    );
  }

  Future<void> deleteCategory(Category c) async {
    final Database db = await instance.dataBase;
    db.delete(
      TodoFields.tableTodo,
      where: '${TodoFields.id} = ? ',
      whereArgs: [c.id],
    );
    db.delete(
      TodoFields.tableTodo,
      where: '${TodoFields.parentID} = ? ',
      whereArgs: [c.id],
    );
  }

  Future<Category> readCategory(int id) async {
    final Database db = await instance.dataBase;
    final maps = await db.query(
      TodoFields.tableTodo,
      where: '${TodoFields.id} = ? ',
      whereArgs: [id],
    );
    return Category.fromJson(maps.first);
  }

  Future<Task> readTask(int id) async {
    final Database db = await instance.dataBase;
    final maps = await db.query(
      TodoFields.tableTodo,
      where: '${TodoFields.id} = ? ',
      whereArgs: [id],
    );
    return Task.fromJson(maps.first);
  }

  Future<List<Category>> readAllCategories() async {
    final Database db = await instance.dataBase;
    final maps = await db.query(TodoFields.tableTodo,
        where: "${TodoFields.parentID} IS NULL");
    maps.forEach((e) {});
    return maps.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Task>> readAllTasks(int parentID) async {
    final Database db = await instance.dataBase;

    final maps = await db.query(TodoFields.tableTodo,
        where: "${TodoFields.parentID} = ? ", whereArgs: [parentID]);

    maps.forEach((e) {});
    return maps.map((e) => Task.fromJson(e)).toList();
  }
}
