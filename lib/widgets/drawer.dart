import 'package:budget_app/utils/routes.dart';
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
            child: UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              accountEmail: Text("admin@gmail.com"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.indigo[600]),
            title: Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[600],
              ),
            ),
            onTap: () async {
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined, color: Colors.indigo[600]),
            title: Text(
              " Expenses Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[600],
              ),
            ),
            onTap: () async {
              Navigator.pushNamed(context, MyRoutes.categoryRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_rounded,
                color: Colors.indigo[600]),
            title: Text(
              "Income",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[600],
              ),
            ),
            onTap: () async {
              Navigator.pushNamed(context, MyRoutes.incomeRoute);
            },
          ),
        ],
      ),
    );
  }
}
