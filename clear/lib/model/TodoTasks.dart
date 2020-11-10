import 'package:clear/model/Utils.dart';

class ToDoTasks {
  int id;
  String name;
  int isDone;
  int isEditable;

  ToDoTasks({this.name, this.isDone = 0, this.isEditable = 0});
  ToDoTasks.withId(this.id, this.name, this.isDone, [this.isEditable]);

  void toggleDone() {
    isDone = 1;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnIsDone: isDone,
      columnIsEditable: isEditable
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  //ToDoTasks();

  ToDoTasks.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    isDone = map[columnIsDone];
    isEditable = map[columnIsEditable];
  }
}
