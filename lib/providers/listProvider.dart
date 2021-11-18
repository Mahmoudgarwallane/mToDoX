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
  addList(String listName) {
    lists.add(Lista(
        listName: listName,
        listTile: CustomListTile(
          listname: listName,
          index: index,
        )));
    notifyListeners();
    index++;
  }

  get lists {
    return _lists;
  }
}

// class Upper {
//   late List<CustomListTile> lists;

// Upper({required this.listTile,});
//   addlist(String listName) {
//     lists.add(Lista(listName: listName, listTile: CustomListTile(listname:listName,)).listTile);
//   }

//   get list {
//     return lists;
//   }
// }

class Lista {
  CustomListTile listTile;
  final listName;
  late List<Task> tasks = [];

  Lista({required this.listName, required this.listTile});
  int index = 0;
  addTask(String taskName, String taskdetails) {
    tasks.add(Task(
        taskName: taskName,
        taskdetails: taskdetails,
        tasktile: CustomListTile(
          listname: listName,
          index: index,
        )));
    index++;
  }
}

class Task {
  final String taskName;
  final String? taskdetails;
  final CustomListTile tasktile;
  Task({required this.taskName, this.taskdetails, required this.tasktile});
}
