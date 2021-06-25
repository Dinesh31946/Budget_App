import 'package:budget_app/pages/Login/component/background.dart';
import 'package:budget_app/pages/Login/component/rounded_button.dart';
import 'package:budget_app/pages/Login/component/rounded_input_field.dart';
import 'package:budget_app/pages/Login/component/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontFamily: GoogleFonts.aBeeZee().fontFamily,
            ),
          ),
          SvgPicture.asset(
            "assets/images/login_page.svg",
            width: size.width * 0.9,
          ),
          Form(
            child: Column(
              children: [
                RoundedInputFields(
                  hintText: 'Your Email',
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "LOGIN",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
