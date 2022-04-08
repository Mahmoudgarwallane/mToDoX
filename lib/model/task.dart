import 'package:mtodox/cubit/todo_cubit.dart';

class Task {
  final int? id;
  final String name;
  final int parentID;

  final String description;
  Task({
    required this.parentID,
    this.id,
    required this.name,
    required this.description,
  });

  Task copy({
    int? id,
    String? name,
    String? description,
    int? parentID
  }) {
    return Task(
      parentID: parentID??this.parentID,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() => {
        TodoFields.id: id,
        TodoFields.parentID : parentID,
        TodoFields.name: name,
        TodoFields.description: description
      };

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      parentID: map[TodoFields.parentID],
      name: map[TodoFields.name] as String,
      id: map[TodoFields.id] as int,
      description: map[TodoFields.description] as String,
    );
  }
}
