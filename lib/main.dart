import 'package:flutter/material.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'assets/colors.dart';
import 'pages/lists_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Todo : add time feature (abdo's sugestion)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  color mycolors = color();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit([Category(name: "task 3"),Category(name: "task 4")]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Tajawal",
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: mycolors.purple), // 1
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ListPage(),
        },
      ),
    );
  }
}
