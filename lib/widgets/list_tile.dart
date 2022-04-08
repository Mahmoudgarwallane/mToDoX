import 'package:flutter/material.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import '../assets/colors.dart';

import '../model/category.dart';
import '../pages/task_page.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatefulWidget {
  final Category category;
  const CustomListTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(1, 5)),
              ],
              color: color.color4,
            ),
            child: Dismissible(
              onDismissed: (direction) {
                context.read<TodoCubit>().deleteCategory(widget.category);
                setState(() {
                  visible = false;
                });
              },
              key: Key(widget.category.name),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TaskPage(
                        category: widget.category,
                      );
                    }));
                  },
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.circle,
                        color: color.color3,
                      )),
                  title: Text(
                    widget.category.name,
                    style: TextStyle(fontSize: 18, color: color.color2),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
