import 'dart:ui';
import 'package:budget_app/widgets/drawer/components/drawerList.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Easy Budget",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[600],
                        )),
                    Text(
                      "Monthly Budget Planner",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[600],
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    textStyle: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: Text("Create a budget"),
                )
              ],
            ),
          ),
          DrawrList(),
        ],
      ),
    );
  }
}
