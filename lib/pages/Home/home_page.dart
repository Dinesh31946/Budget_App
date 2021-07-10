import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/categoryModel.dart';
import 'package:budget_app/pages/Home/components/showDialouge.dart';
import 'package:budget_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> datas = [];
  bool fetching = true;

  late DB db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowDialouge();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
