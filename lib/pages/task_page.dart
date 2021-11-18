import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:mtodox/providers/taskProvider.dart';
import 'package:mtodox/widgets/tile.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:mtodox/widgets/task_dialog.dart';

class TaskPage extends StatelessWidget {
  Lista list;
  TaskPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListProvider>(context, listen: false);
    final listProviderlistener = Provider.of<ListProvider>(context);

    color my_Colors = color();
    return Directionality(
      // add this
      textDirection: TextDirection.rtl, // set this property
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: my_Colors.purple,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Mtaskdialog().ListDialog(context, list.index);
          },
        ),
        appBar: AppBar(
          backgroundColor: my_Colors.lightblue,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              list.listName,
              style: GoogleFonts.changa(fontSize: 45, color: my_Colors.black),
            ),
          ),
        ),
        body: Container(
          color: my_Colors.lightblue,
          child: ListView.builder(
            itemCount: list.tasks.length,
            itemBuilder: (context, index) {
              return listProviderlistener.lists[list.index].tasks[index].tasktile;
              // return Provider.of<ListProvider>(context).lists[index].listTile;
            }
            //! heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeereeeeeee
            //        CustomListTile(
            //          my_Colors: my_Colors,
            //          listname: "الدراسة",
            //        ),
            //        CustomListTile(
            //          my_Colors: my_Colors,
            //          listname: "meeeee",
            //       ),
            ,
          ),
        ),
      ),
    );
  }
}
