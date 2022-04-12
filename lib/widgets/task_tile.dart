import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:mtodox/pages/detail_page.dart';
import '../cubit/todo_cubit.dart';
import 'package:provider/provider.dart';



class CustomTaskTile extends StatelessWidget {
  final Task task;
  final Category category;
  final Function(Category c,Task t) onDismissed;

  CustomTaskTile({
    required this.onDismissed,
    Key? key,
    required this.task,
    required this.category,
  }) : super(key: key);

  final color my_Colors = color();

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(1, 5)),
            ],
            color: my_Colors.deepwhite,
          ),
          child: Dismissible(
            onDismissed: (direction) {
              onDismissed(category,task);
            },
            key: Key(task.name),
            background: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  if (task.description != "") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(
                        task: task,
                      );
                    }));
                  }
                },
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle,
                      color: my_Colors.purple,
                    )),
                title: Text(
                  task.name,
                  style: TextStyle(fontSize: 18, color: my_Colors.black),
                ),
              ),
            ),
          )),
    );
  }
}
