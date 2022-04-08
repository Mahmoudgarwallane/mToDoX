import 'package:flutter/material.dart';
import 'package:mtodox/cubit/todo_cubit.dart';
import 'assets/colors.dart';
import 'pages/lists_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Todo : add time feature (abdo's sugestion)
void main()async {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit([]),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Tajawal",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ListPage(),
        },
      ),
    );
  }
}
