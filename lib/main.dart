import 'package:flutter/material.dart';
import 'package:mtodox/assets/colors.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/pages/detail_page.dart';
import 'pages/lists_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  color mycolors = color();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: mycolors.purple), // 1
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListPage(),
        '/detail': (context) => DetailPage()
      },
    );
  }
}
