import 'package:budget_app/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
      ),
      drawer: MyDrawer(),
    );
  }
}
