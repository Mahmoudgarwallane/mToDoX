import 'package:bloc/bloc.dart';
import 'package:mtodox/db/todo_db.dart';
import 'package:sqflite/sqflite.dart';

import '../model/category.dart';
import '../model/task.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<Category> categories;

  TodoCubit(this.categories) : super(TodoInitial(categories: categories));
  Future<void> loadCategories() async {
    TodoDatabase db = TodoDatabase.instance;
    categories = await db.readAllCategories();
    emit(TodoState(categories: categories));
  }

  Future<void> loadTasks(Category c) async {
    final index = categories.indexOf(c);
    TodoDatabase db = TodoDatabase.instance;
    categories[index].tasks = await db.readAllTasks(c.id!);
    emit(TodoState(categories: categories));
  }

  void addCategory(Category c) async {
    TodoDatabase db = TodoDatabase.instance;
    db.createCategory(c);
    state.categories.add(c);
    await loadCategories();
    emit(TodoState(categories: categories));
  }

  void addTask(Category c, Task t) async {
    TodoDatabase db = TodoDatabase.instance;
    await db.createTask(t);
    c.tasks.add(t);

    await loadTasks(c);
    emit(TodoState(categories: categories));
  }

  void deleteTask(Category c, Task t) {
    TodoDatabase db = TodoDatabase.instance;
    db.deleteTask(t.id!);
    c.tasks.remove(t);
    emit(TodoState(categories: categories));
  }

  void deleteCategory(Category c) {
    TodoDatabase db = TodoDatabase.instance;
    db.deleteCategory(c);
    state.categories.remove(c);
    emit(state);
  }
}
