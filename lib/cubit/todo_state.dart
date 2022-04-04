part of 'todo_cubit.dart';

class Task {
  String name;
 
  String description;
  Task({
    required this.name,
    required this.description,
  });
}

class Category {
  final List<Task> tasks  = [];
  String name;
  Category({
    required this.name,
  });
}

class TodoState {
  final List<Category> categories;
  TodoState({
    required this.categories,
  });
}

class TodoInitial extends TodoState {
  TodoInitial({required List<Category> categories})
      : super(
          categories:categories,
        );
}

