import 'package:flutter/material.dart';
import 'package:clear/model/TodoTasks.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:clear/model/Task_data.dart';
import 'package:provider/provider.dart';
import 'package:clear/model/databaseHelper.dart';

class ListViewCard extends StatefulWidget {
  // final int index;
//  final Key key;
  // final List<String> listItems;
  final ToDoTasks tasks;

  ListViewCard(this.tasks);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  void rowPressed() {
    showBottomSheet(context: null, builder: null);
  }

  String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      child: (widget.tasks.isEditable == 1)
                          ? TextField(
                              autofocus: true,
                              textAlign: TextAlign.center,
                              onSubmitted: (newString) {
                                newTaskTitle = newString;
                                DatePicker.showDateTimePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2020, 11, 1, 5, 30),
                                    maxTime: DateTime(2020, 11, 31, 5, 30),
                                    onConfirm: (date) async {
                                  var user = ToDoTasks();
                                  user.name = newTaskTitle;
                                  user.isDone = 0;
                                  user.isEditable = 0;
                                  var dbHelper = Helper();
                                  dbHelper.insert(user).then((value) {
                                    context
                                        .read<TaskData>()
                                        .addToDoTasks(value);
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              onChanged: (newText) {
                                newTaskTitle = newText;
                              },
                            )
                          : Text(
                              widget.tasks.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  decoration: (widget.tasks.isDone == 1)
                                      ? TextDecoration.lineThrough
                                      : null),
                              textAlign: TextAlign.left,
                              maxLines: 5,
                            )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
