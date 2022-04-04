import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';

import '../assets/colors.dart';

class Mtaskdialog {
  color mycolor = color();
  Future<void> ListDialog(BuildContext context, Category category) {
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    TextEditingController tasknamecontroller = TextEditingController();
    TextEditingController taskdetailscontroller = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<TodoCubit, TodoState>(
            listener: ((context, state) {}),
            builder: (context, state) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: mycolor.lightblue,
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
                            style:
                                TextStyle(fontSize: 18, color: mycolor.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              controller: tasknamecontroller,
                              autofocus: true,
                              textDirection: TextDirection.rtl,
                              cursorColor: mycolor.black,
                              decoration: InputDecoration(
                                  fillColor: mycolor.white,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: mycolor.purple))),
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
                            style:
                                TextStyle(fontSize: 18, color: mycolor.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextField(
                              controller: taskdetailscontroller,
                              textDirection: TextDirection.rtl,
                              cursorColor: mycolor.black,
                              decoration: InputDecoration(
                                  fillColor: mycolor.white,
                                  filled: true,
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: mycolor.purple))),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mycolor.purple,
                        ),
                        onPressed: () {
                          context.read<TodoCubit>().addTask(category,
                              Task(name: tasknamecontroller.text, description: taskdetailscontroller.text));
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "إنشاء",
                            style:
                                TextStyle(fontSize: 18, color: mycolor.white),
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
