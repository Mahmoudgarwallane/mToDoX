import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:mtodox/db/todo_db.dart';
import 'package:mtodox/widgets/task_tile.dart';

import '../assets/colors.dart';
import '../model/category.dart';
import '../widgets/task_dialog.dart';

class TaskPage extends StatefulWidget {
  late Category category;
  TaskPage({Key? key, required this.category}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TodoCubit>().loadTasks(widget.category);
  }

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: color.color3,
              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Mtaskdialog().ListDialog(context, widget.category);
              },
            ),
            backgroundColor: color.color5,
            appBar: AppBar(
              leading: BackButton(
                color: color.color3,
              ),
              toolbarHeight: 70,
              backgroundColor: color.color5,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.category.name,
                  style: TextStyle(fontSize: 45, color: color.color2),
                ),
              ),
            ),
            body: Container(
                color: color.color5,
                child: Builder(builder: (context) {
                  if (widget.category.tasks.isEmpty) {
                    return Center(
                        child: Text(
                      "أضف مهمة",
                      style: TextStyle(fontSize: 20, color: color.color2),
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: widget.category.tasks.length,
                      itemBuilder: (context, index) {
                        return CustomTaskTile(
                          onDismissed: (c, t) {
                            context.read<TodoCubit>().deleteTask(c, t);
                            setState(() {});
                          },
                          task: widget.category.tasks[index],
                          category: widget.category,
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
