import 'package:aking_to_do_list/database/task_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  static const DB_NAME = 'task.db';
  static const DB_VERSION = 1;
  static Database? _database;

  Database get database => _database!;

  static const initScripts = [TaskTable.CREATE_TABLE_QUERY];

  TaskDatabase._internal();
  static final TaskDatabase instance = TaskDatabase._internal();

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScripts.forEach((script) async => await db.execute(script));
      },
      version: DB_VERSION,
    );
  }
}
