import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  final String listname;
  int? index;
  CustomListTile({
    Key? key,
    this.index,
    required this.listname,
  }) : super(key: key);

  final color my_Colors = color();

//!!!!!!!!!!!!!!!!!!!!!!!!!!

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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TaskPage(
                    list: listProvider.lists[index],
                  );
                }));
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
