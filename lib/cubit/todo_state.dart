part of 'todo_cubit.dart';

class TodoFields {
  static final tableTodo = "todo";
  static final id = "id";
  static final name = "name";
  static final description = "description";
  static final parentID = "parentID";
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
          categories: categories,
        );
}
