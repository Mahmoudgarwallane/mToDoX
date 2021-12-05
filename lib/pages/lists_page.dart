import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:mtodox/widgets/list_dialog.dart';
import 'package:mtodox/pages/task_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color my_Colors = color();
    return Directionality(
      // add this
      textDirection: TextDirection.rtl, // set this property

      child: Consumer<ListProvider>(
        builder: (context, value, child) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: my_Colors.purple,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Mdialog().ListDialog(context);
            },
          ),
          appBar: AppBar(
            backgroundColor: my_Colors.lightblue,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "القوائم",
                style: GoogleFonts.changa(fontSize: 45, color: my_Colors.black),
              ),
            ),
          ),
          body: Container(
            color: my_Colors.lightblue,
            child: Builder(builder: (context) {
              if (Provider.of<ListProvider>(context).lists.length == 0) {
                return Center(
                    child: Text(
                  "أضف قائمة",
                  style:
                      GoogleFonts.tajawal(fontSize: 20, color: my_Colors.black),
                ));
              } else {
                return ListView.builder(
                    itemCount: Provider.of<ListProvider>(context).lists.length,
                    itemBuilder: (context, index) {
                      return Provider.of<ListProvider>(context)
                          .lists[index]
                          .listTile;
                    });
              }
            }),
          ),
        ),
      ),
    );
  }
}
