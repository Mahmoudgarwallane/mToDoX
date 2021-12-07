import 'package:provider/provider.dart';
import 'package:mtodox/widgets/list_tile.dart';
import 'package:mtodox/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/objects/task.dart';

class ListProvider extends ChangeNotifier {
  List<Lista> _lists = [];
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
    index++;
    notifyListeners();
  }

  addTask(String taskName, String taskdetails, int indx) {
    _lists[indx]._tasks.add(Task(
        index: _lists[indx].task_index,
        taskName: taskName,
        taskdetails: taskdetails,
        tasktile: CustomTaskTile(
          listname: taskName,
          Task_index: _lists[indx].task_index,
          List_index: indx,
          listDescription: taskdetails,
        )));
    _lists[indx].incrementTaskIndix();
    notifyListeners();

    // Provider.of<ListProvider>(context, listen: false).notifyListeners();
  }

  get lists {
    return _lists;
  }
}

class Lista extends ListProvider {
  CustomListTile listTile;
  final listName;
  BuildContext context;
  late List<Task> _tasks = [];
  int index = 0;
  int task_index = 0;
  void incrementTaskIndix() {
    task_index++;
  }

  Lista(
      {required this.listName,
      required this.listTile,
      required this.index,
      required this.context});
  get tasks {
    return _tasks;
  }
}

class Task {
  int index;
  final String taskName;
  final String taskdetails;
  final CustomTaskTile tasktile;
  Task({
    required this.index,
    required this.taskName,
    required this.taskdetails,
    required this.tasktile,
  });
}
