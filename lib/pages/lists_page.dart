import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'package:mtodox/db/todo_db.dart';
import 'package:mtodox/widgets/list_tile.dart';
import '../assets/colors.dart';
import '../model/category.dart';
import '../widgets/list_dialog.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TodoCubit>().loadCategories();
    bool isDark = false;
  }

  @override
  void dispose() {
    TodoDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // add this
      textDirection: TextDirection.rtl, // set this property

      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: color.color3,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Mdialog().ListDialog(context);
            },
          ),
          backgroundColor: color.color5,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.read<TodoCubit>().readAll();
                },
                icon: Icon(Icons.chrome_reader_mode_outlined)),
            toolbarHeight: 70,
            backgroundColor: color.color5,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    isDark = !isDark;
                    setState(() {
                      color.switchTheme(isDark);
                    });
                  },
                  icon: Icon(
                    !isDark ? Icons.dark_mode : Icons.light_mode,
                    color: color.color3,
                  )),
            ],
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "القوائم",
                style: TextStyle(fontSize: 45, color: color.color2),
              ),
            ),
          ),
          body: Container(
            color: color.color5,
            child: Builder(builder: (context) {
              if (context.watch<TodoCubit>().categories.isEmpty) {
                return Center(
                    child: Text(
                  "أضف قائمة",
                  style: TextStyle(fontSize: 20, color: color.color2),
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
