import 'package:bloc/bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<Category> categories;
  TodoCubit(this.categories) : super(TodoInitial(categories: categories));

  void addCategory(Category c) {
    state.categories.add(c);
    emit(TodoState(categories: categories));
  }

  void addTask(Category c, Task t) {
    c.tasks.add(t);
    emit(TodoState(categories: categories));
  }

  void deleteTask(Category c, Task t) {
    c.tasks.remove(t);
    emit(TodoState(categories: categories));
  }

  void deleteCategory(Category c) {
    categories.forEach((element) {
      print(element.name);
    });
    ;
    print("fdfdfdfdfdfdf");
    state.categories.remove(c);
    categories.forEach((element) {
      print(element.name);
    });
    emit(state);
  }
}
