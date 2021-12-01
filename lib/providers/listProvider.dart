import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/objects/task.dart';

class ListProvider with ChangeNotifier {
  List<Lista> _lists = [];
  // popit(BuildContext context) {
  //   print("here");
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => TaskPage()));
  // }
  int index = 0;
  addList(String listName, BuildContext context) {
    _lists.add(Lista(
        context: context,
        index: index,
        listName: listName,
        listTile: CustomListTile(
          listname: listName,
          index: index,
        )));
    print("list index" + index.toString());
    index++;
    notifyListeners();
  }

  get lists {
    return _lists;
  }
}

class Lista with ChangeNotifier {
  CustomListTile listTile;
  final listName;
  BuildContext context;
  late List<Task> _tasks = [];
  int index = 0;
  int task_index = 0;
  Lista(
      {required this.listName,
      required this.listTile,
      required this.index,
      required this.context});
  addTask(String taskName, String taskdetails) {
    print("before null");
    _tasks.add(Task(
        index: task_index,
        taskName: taskName,
        taskdetails: taskdetails,
        tasktile: CustomListTile(
          listname: taskName,
          index: index,
        )));
    print("task index" + task_index.toString());
    notifyListeners();

    task_index++;
    // Provider.of<ListProvider>(context, listen: false).notifyListeners();

    print("after null");
  }

  get tasks {
    return _tasks;
  }
}

class Task {
  int index;
  final String taskName;
  final String? taskdetails;
  final CustomListTile tasktile;
  Task({
    required this.index,
    required this.taskName,
    this.taskdetails,
    required this.tasktile,
  });
}
