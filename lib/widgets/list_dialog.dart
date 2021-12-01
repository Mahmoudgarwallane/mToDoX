import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/pages/task_page.dart';

class Mdialog {
  color mycolor = color();
  Future<void> ListDialog(BuildContext context) {


    final listProvider = Provider.of<ListProvider>(context, listen: false);
    var max_width = MediaQuery.of(context).size.width;
    var max_height = MediaQuery.of(context).size.height;
    TextEditingController tasknamecontroller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer(
            builder: (context, __, _) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: mycolor.lightblue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                content: Container(
                  width: max_width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "اسم القائمة",
                            style: GoogleFonts.tajawal(
                                fontSize: 18, color: mycolor.black),
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
                                  enabledBorder: OutlineInputBorder(
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
                          listProvider.addList(tasknamecontroller.text,context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "إنشاء",
                            style: GoogleFonts.tajawal(
                                fontSize: 18, color: mycolor.white),
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
