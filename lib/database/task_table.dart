import 'package:aking_to_do_list/database/task_databse.dart';
import 'package:aking_to_do_list/model/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskTable {
  static const TABLE_NAME = 'task';
  static const CREATE_TABLE_QUERY = """
    CREATE TABLE $TABLE_NAME (
        id INTEGER PRIMARY KEY,
        title TEXT
    )
  """;

  static const DROP_TABLE_QUERY = """
    DROP TABLE IF EXISTS $TABLE_NAME
  """;

  Future<void> insertTask(Task task) async {
    final Database db = TaskDatabase.instance.database;
    await db.insert(
      TABLE_NAME,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(Task task) async {
    final Database db = TaskDatabase.instance.database;
    await db.delete(
      TABLE_NAME,
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> selectAllTask() async {
    final Database db = TaskDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('task');
    return List.generate(maps.length, (index) {
      return Task.fromData(
        maps[index]['id'],
        maps[index]['title'],
      );
    });
  }
}
