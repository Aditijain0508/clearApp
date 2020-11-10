import 'package:clear/model/TodoTasks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:clear/model/Utils.dart';

class Helper {
  static final Helper _instance = new Helper.internal();
  factory Helper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableUser ( 
          $columnId integer primary key autoincrement, 
          $columnName text not null,
          $columnIsDone INTEGER NOT NULL,
          $columnIsEditable INTEGER NOT NULL)
          ''');
    });
    return theDb;
  }

  Helper.internal();

  Future<ToDoTasks> insert(ToDoTasks task) async {
    var dbClient = await db;
    task.id = await dbClient.insert(tableUser, task.toMap());
    return task;
  }

  Future<ToDoTasks> getUser(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnId, columnName, columnIsDone, columnIsEditable],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return ToDoTasks.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(ToDoTasks user) async {
    var dbClient = await db;
    return await dbClient.update(tableUser, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future<List> getAllUsers() async {
    List<ToDoTasks> user = List();
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnId, columnName, columnIsDone, columnIsEditable]);
    if (maps.length > 0) {
      maps.forEach((f) {
        user.add(ToDoTasks.fromMap(f));
//          print("getAllUsers"+ User.fromMap(f).toString());
      });
    }
    return user;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
