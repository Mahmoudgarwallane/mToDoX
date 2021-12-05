import 'package:flutter/material.dart';
import 'package:mtodox/widgets/list_tile.dart';


// ! this is not used in the project

class Upper {
  late List<Lista> lists;

//Upper({required this.listTile,});
  addist(String listName, CustomListTile listTile) {
    lists.add(Lista(listName: listName, listTile: listTile));
  }
}

class Lista {
  CustomListTile listTile;
  final listName;
  List<Task> tasks = [];

  Lista({required this.listName, required this.listTile});

  addTask(String taskName, String taskdetails, CustomListTile tasktile) {
    tasks.add(
        Task(taskName: taskName, taskdetails: taskdetails, tasktile: tasktile));
  }
}

class Task {
  final String taskName;
  final String? taskdetails;
  final CustomListTile tasktile;
  Task({required this.taskName, this.taskdetails, required this.tasktile});
}
