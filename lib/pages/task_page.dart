import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:mtodox/widgets/task_dialog.dart';

class TaskPage extends StatelessWidget {
  late Lista? list;
  TaskPage({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListProvider taskProvider = Provider.of<ListProvider>(context);
    color my_Colors = color();
    return Consumer<ListProvider>(
      builder: (context, value, child) {
        return Directionality(
          // add this
          textDirection: TextDirection.rtl, // set this property
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: my_Colors.purple,
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                Mtaskdialog().ListDialog(context, list!.index);
              },
            ),
            appBar: AppBar(
              backgroundColor: my_Colors.lightblue,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  list!.listName,
                  style:
                      GoogleFonts.changa(fontSize: 45, color: my_Colors.black),
                ),
              ),
            ),
            body: Container(
                color: my_Colors.lightblue,
                child: Builder(builder: (context) {
                  if (taskProvider.lists[list!.index].tasks.length == 0) {
                    return Center(
                        child: Text(
                      "أضف مهمة",
                      style: GoogleFonts.tajawal(
                          fontSize: 20, color: my_Colors.black),
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: taskProvider.lists[list!.index].tasks.length,
                      itemBuilder: (context, index) {
                        return taskProvider
                            .lists[list!.index].tasks[index].tasktile;
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
