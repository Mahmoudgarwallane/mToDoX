import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:mtodox/widgets/list_tile.dart';
import '../assets/colors.dart';
import '../widgets/list_dialog.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    color myColors = color();
    return Directionality(
      // add this
      textDirection: TextDirection.rtl, // set this property

      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: myColors.purple,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Mdialog().ListDialog(context);
            },
          ),
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: myColors.lightblue,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "القوائم",
                style: TextStyle(fontSize: 45, color: myColors.black),
              ),
            ),
          ),
          body: Container(
            color: myColors.lightblue,
            child: Builder(builder: (context) {
              if (context.watch<TodoCubit>().categories.isEmpty) {
                return Center(
                    child: Text(
                  "أضف قائمة",
                  style: TextStyle(fontSize: 20, color: myColors.black),
                ));
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: context.watch<TodoCubit>().categories.length,
                    itemBuilder: (context, index) {
                      Category category =
                          context.watch<TodoCubit>().categories[index];
                      return CustomListTile(
                        category: category,
                        onDismissed: (c) {
                          context.read<TodoCubit>().deleteCategory(c);
                          setState(() {});
                        },
                      );
                    });
              }
            }),
          ),
        ),
      ),
    );
  }
}


