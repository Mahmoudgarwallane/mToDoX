import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtodox/providers/listProvider.dart';
import 'package:mtodox/assets/colors.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    color my_Colors = color();
    double maxwidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(
            backgroundColor: my_Colors.deepwhite,
            appBar: AppBar(
              backgroundColor: my_Colors.deepwhite,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  task.taskName,
                  
                  style: GoogleFonts.changa(
                      fontSize: 25,
                      color: my_Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, bottom: 20),
                          child: Text('تفاصيل المهمة',
                              style: GoogleFonts.tajawal(
                                  fontSize: 24,
                                  color: my_Colors.black,
                                  fontWeight: FontWeight.w300)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: my_Colors.lightblue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(task.taskdetails,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 24,
                                    color: my_Colors.black,
                                  )),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            )));
  }
}
