import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:mtodox/pages/detail_page.dart';
import '../cubit/todo_cubit.dart';
import 'package:provider/provider.dart';

import '../model/category.dart';
import '../model/task.dart';

class CustomTaskTile extends StatefulWidget {
  final Task task;
  final Category category;

  const CustomTaskTile({Key? key, required this.task, required this.category})
      : super(key: key);

  @override
  State<CustomTaskTile> createState() => _CustomTaskTileState();
}

class _CustomTaskTileState extends State<CustomTaskTile> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: color.color1.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(1, 5)),
              ],
              color: color.color4,
            ),
            child: Dismissible(
              onDismissed: (direction) {
                context
                    .read<TodoCubit>()
                    .deleteTask(widget.category, widget.task);
                setState(() {
                  visible = false;
                });
              },
              key: Key(widget.task.name),
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
                    if (widget.task.description != "") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(
                          task: widget.task,
                        );
                      }));
                    }
                  },
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.circle,
                        color: color.color3,
                      )),
                  title: Text(
                    widget.task.name,
                    style: TextStyle(fontSize: 18, color: color.color2),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
