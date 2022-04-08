import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';

import '../assets/colors.dart';
import '../model/category.dart';
import '../model/task.dart';

class Mtaskdialog {
  Future<void> ListDialog(BuildContext context, Category category) {
    var maxWidth = MediaQuery.of(context).size.width;
    TextEditingController taskNameController = TextEditingController();
    TextEditingController taskDetailsController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<TodoCubit, TodoState>(
            listener: ((context, state) {}),
            builder: (context, state) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: color.color5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                content: SizedBox(
                  width: maxWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "اسم المهمة",
                            style: TextStyle(fontSize: 18, color: color.color2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: TextStyle(color: color.color2),
                              controller: taskNameController,
                              autofocus: true,
                              textDirection: TextDirection.rtl,
                              cursorColor: color.color2,
                              decoration: InputDecoration(
                                  fillColor: color.color1,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: color.color3))),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "تفاصيل المهمة",
                            style: TextStyle(fontSize: 18, color: color.color2),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              style: TextStyle(color: color.color2),
                              controller: taskDetailsController,
                              textDirection: TextDirection.rtl,
                              cursorColor: color.color2,
                              decoration: InputDecoration(
                                  fillColor: color.color1,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: color.color3))),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: color.color3,
                        ),
                        onPressed: () {
                          context.read<TodoCubit>().addTask(
                              category,
                              Task(
                                  name: taskNameController.text,
                                  description: taskDetailsController.text,
                                  parentID: category.id!));
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "إنشاء",
                            style: TextStyle(fontSize: 18, color: color.color1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
