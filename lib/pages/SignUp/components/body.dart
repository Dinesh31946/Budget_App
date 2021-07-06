import 'package:budget_app/pages/SignUp/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGNUP",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
              ),
            ),
            SvgPicture.asset(
              "assets/images/signup.svg",
              height: size.height * 0.30,
            ),
          ],
        ),
      ),
    ));
  }
}
