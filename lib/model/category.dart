import 'dart:convert';

import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:mtodox/model/task.dart';

class Category {
  final int? id;
  List<Task> tasks = [];
  final String name;
  Category({
    this.id,
    required this.name,
  });

  Category copy({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() => {TodoFields.id: id, TodoFields.name: name};

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      name: map[TodoFields.name] as String,
      id: map[TodoFields.id] as int,
    );
  }

  @override
  String toString() => 'Category(id: $id, tasks: $tasks, name: $name)';
}
