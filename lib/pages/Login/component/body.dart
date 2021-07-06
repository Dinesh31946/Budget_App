import 'package:budget_app/pages/Login/component/already_have_account_text.dart';
import 'package:budget_app/pages/Login/component/background.dart';
import 'package:budget_app/pages/Login/component/rounded_button.dart';
import 'package:budget_app/pages/Login/component/rounded_input_field.dart';
import 'package:budget_app/pages/Login/component/rounded_password_field.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
                "LOGIN",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: SvgPicture.asset(
                  "assets/images/login_page.svg",
                  width: size.width * 0.9,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedInputFields(
                      controller: email,
                      hintText: 'Your Email',
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      controller: password,
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          await Navigator.pushReplacementNamed(
                              context, MyRoutes.homeRoute);
                        }
                      },
                    ),
                    AlreadyHaveAnAccountCheck(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
