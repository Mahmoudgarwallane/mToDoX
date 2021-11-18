import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:mtodox/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:mtodox/pages/task_page.dart';
import 'package:mtodox/pages/detail_page.dart';

class Taskprovider with ChangeNotifier {
  List<CustomListTile> _lists = [];
  popit(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
  }

  void addList(String listName, String listDetail, BuildContext context) {
    _lists.add(CustomListTile(
      listname: listName,
    ));
    notifyListeners();
  }

  get lists {
    return _lists;
  }
}
