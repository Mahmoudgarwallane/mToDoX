import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/pages/detail_page.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:provider/provider.dart';

class CustomTaskTile extends StatelessWidget {
  final String listname;
  final String listDescription;
  final int List_index;
  final int Task_index;
  CustomTaskTile({
    Key? key,
    required this.List_index,
    required this.Task_index,
    required this.listDescription,
    required this.listname,
  }) : super(key: key);

  final color my_Colors = color();

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(1, 5)),
            ],
            color: my_Colors.deepwhite,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                if (listProvider
                        .lists[List_index].tasks[Task_index].taskdetails !=
                    "") {
                  

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(
                      task: listProvider.lists[List_index].tasks[Task_index],
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
                listname,
                style:
                    GoogleFonts.tajawal(fontSize: 18, color: my_Colors.black),
              ),
            ),
          )),
    );
  }
}
