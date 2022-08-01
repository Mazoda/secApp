import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:secondapp/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DpHelper {
  DpHelper._();

  static const String databaseName = "tasks";
  static const String tabelName = "tasks";
  static const String taskId = "task_id";
  static const String taskName = 'task_name';
  static const String taskType = "task_type";
  static const String taskIsComplete = "task_completed";
  static const String taskDes = 'task_desccription';
  static const String taskdate = 'task_date';
  static const String tabelName2 = "tasktype";
  static const String typeTitle = "type_Title";
  static const String typeId = "type_ID";

  static DpHelper dpHelper = DpHelper._();
  Database? database;

  initDatabase() async {
    database = await createDataBase();
  }

  Future<Database> createDataBase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);

    Database database = await openDatabase(path,
        onCreate: _onCreate, version: 1, onOpen: _onOpen);
    return database;
  }

  _onCreate(Database db, int version) {
    db.execute('''
CREATE TABLE $tabelName2 (
  $typeId INTEGER PRIMARY KEY AUTOINCREMENT,
  $typeTitle Text,

  )
''');
    db.execute('''

CREATE TABLE $tabelName (
  $taskId INTEGER PRIMARY KEY AUTOINCREMENT,
  $taskName TEXT,
  $typeId INTEGER,
  $taskDes TEXT,
  $taskdate DATE,
  $taskIsComplete INTEGER,
   FOREIGN KEY ($typeId) REFERENCES $tabelName2($typeId)
  )

''');
  }

  _onOpen(Database db) {
    log("Database opened  ${db.toString()} ");
  }

  insertOneTask(TaskModel taskModel) async {
    int id = await database!.insert(tabelName, taskModel.toMap());
    taskModel.copy(id);
  }

  Future<List<TaskModel>> selectAllTask() async {
    List allTasks = await database!.query(tabelName);
    print(allTasks);
    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }

  Future<List<TaskModel>> selectCompletedTasks() async {
    List allTasks =
        await database!.query(tabelName, where: '$taskIsComplete=1');

    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }
  selectTaskType(TaskModel taskModel) async {
  await database!.query(tabelName2, where: '$typeId=?',whereArgs:[taskModel.type_ID]);
  }

  Future<List<TaskModel>> selectIncompletedTasks() async {
    List allTasks =
        await database!.query(tabelName, where: '$taskIsComplete=0');

    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }
Future<int?> getCount() async {
    var x = await database!.rawQuery('SELECT COUNT (*) from $tabelName');
    int? count = Sqflite.firstIntValue(x);
    return count;
}

  UpdateComplete(TaskModel taskModel) async {
    int count = await database!.update(tabelName, taskModel.toMap(),
        where: "$taskId=?", whereArgs: [taskModel.id]);
  }

  deleteTask(int id) async {
    await database!.delete(tabelName, where: "$taskId=?", whereArgs: [id]);
    selectAllTask();
  }
}
