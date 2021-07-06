import 'package:budget_app/pages/Home/home_page.dart';
import 'package:budget_app/pages/Login/login_page.dart';
import 'package:budget_app/pages/SignUp/sign_up_page.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Budget',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routes: {
        "/": (context) => WelcomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signUpRoute: (context) => SignUpPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
