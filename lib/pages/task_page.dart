import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:mtodox/widgets/task_tile.dart';

import '../assets/colors.dart';
import '../widgets/task_dialog.dart';

class TaskPage extends StatelessWidget {
  late Category category;
  TaskPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color myColors = color();
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          // add this
          textDirection: TextDirection.rtl, // set this property
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: myColors.purple,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Mtaskdialog().ListDialog(context, category);
              },
            ),
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: myColors.lightblue,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 45, color: myColors.black),
                ),
              ),
            ),
            body: Container(
                color: myColors.lightblue,
                child: Builder(builder: (context) {
                  if (category.tasks.isEmpty) {
                    return Center(
                        child: Text(
                      "أضف مهمة",
                      style: TextStyle(fontSize: 20, color: myColors.black),
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: category.tasks.length,
                      itemBuilder: (context, index) {
                        print(category.tasks);
                        return CustomTaskTile(
                          task: category.tasks[index],
                          category: category,
                        );
                      },
                    );
                  }
                })),
          ),
        );
      },
    );
  }
}
