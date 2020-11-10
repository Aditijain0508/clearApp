import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clear/model/TodoTasks.dart';
import 'package:refreshable_reorderable_list/refreshable_reorderable_list.dart';
import 'package:clear/Screens/ListViewCard.dart';
import 'package:clear/model/databaseHelper.dart';
import 'package:clear/model/Task_data.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var dbHelper = Helper();
        dbHelper.getAllUsers().then((value) {
          for (ToDoTasks data in value) {
            context.read<TaskData>().addToDoTasks(data);
          }
        });
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Swipe List"),
          ),
          body: Container(
            color: Colors.red,
            child: RefreshIndicator(
              onRefresh: Provider.of<TaskData>(context).refreshList,
              child: RefreshableReorderableListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  onReorder: (oldIndex, newIndex) {
                    context.read<TaskData>().updateTaskList(oldIndex, newIndex);
                  },
                  children: [
                    for (ToDoTasks tasks
                        in Provider.of<TaskData>(context).listItems)
                      Dismissible(
                          key: ValueKey(tasks),
                          child: ListViewCard(tasks),
                          background: stackBehindDismiss(),
                          secondaryBackground: stackBehindDismissSecondary(),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              context.read<TaskData>().taskCompleted(tasks);
                            } else {
                              context.read<TaskData>().deleteItem(tasks);
                            }
                          }),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void deleteItem(index) {
    /*
    By implementing this method, it ensures that upon being dismissed from our widget tree,
    the item is removed from our list of items and our list is updated, hence
    preventing the "Dismissed widget still in widget tree error" when we reload.
    */

    setState(() {
      Provider.of<TaskData>(context).listItems.removeAt(index);
    });
  }

  void taskCompleted(index) {
    /*
    This method accepts the parameters index and item and re-inserts the {item} at
    index {index}
    */
    setState(() {
      var toDoToInsert = ToDoTasks(
          name: Provider.of<TaskData>(context).listItems[index].name,
          isDone: 1);
      Provider.of<TaskData>(context).listItems.removeAt(index);
      Provider.of<TaskData>(context).listItems.insert(
          Provider.of<TaskData>(context).listItems.length, toDoToInsert);
    });
  }

  Widget stackBehindDismissSecondary() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.green,
      child: Icon(
        Icons.delete,
        color: Colors.green,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
