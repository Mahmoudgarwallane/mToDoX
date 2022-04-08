import 'package:flutter/material.dart';
import '../assets/colors.dart';
import '../cubit/todo_cubit.dart';
import '../model/task.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  const DetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxwidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: Scaffold(
            backgroundColor: color.color4,
            appBar: AppBar(
              leading: BackButton(
                color: color.color3,
              ),
              backgroundColor: color.color4,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  task.name,
                  style: TextStyle(
                      fontSize: 25,
                      color: color.color2,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 20, bottom: 20),
                        child: Text('تفاصيل المهمة',
                            style: TextStyle(
                                fontSize: 24,
                                color: color.color2,
                                fontWeight: FontWeight.w300)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: color.color5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(task.description,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: color.color2,
                                )),
                          ),
                        ),
                      )
                    ]),
              ),
            )));
  }
}
