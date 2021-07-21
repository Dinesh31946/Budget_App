import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawrList extends StatefulWidget {
  const DrawrList({
    Key? key,
  }) : super(key: key);

  @override
  _DrawrListState createState() => _DrawrListState();
}

class _DrawrListState extends State<DrawrList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.home, color: Colors.indigo[600]),
          title: Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[600],
            ),
          ),
          onTap: () async {
            Navigator.pushNamed(context, MyRoutes.homeRoute);
          },
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 65, top: 25),
          alignment: Alignment.centerLeft,
          child: Text(
            "CATEGORIES",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.robotoMono().fontFamily,
                color: Colors.red.shade700),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet_rounded,
              color: Colors.indigo[600]),
          title: Text(
            "Income",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[600],
            ),
          ),
          onTap: () async {
            Navigator.pushNamed(context, MyRoutes.incomeRoute);
          },
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: -2, vertical: 1),
          leading: Icon(Icons.list_alt_outlined, color: Colors.indigo[600]),
          title: Text(
            " Expenses Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[600],
            ),
          ),
          onTap: () async {
            Navigator.pushNamed(context, MyRoutes.categoryRoute);
          },
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.only(left: 65, top: 25),
          alignment: Alignment.centerLeft,
          child: Text(
            "BUDGET",
            style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.robotoMono().fontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700),
          ),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today, color: Colors.indigo[600]),
          title: Text(
            "My Budget",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[600],
            ),
          ),
          onTap: () async {},
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    );
  }
}
