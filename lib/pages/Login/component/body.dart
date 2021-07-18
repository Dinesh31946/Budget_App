import 'package:budget_app/pages/Login/component/already_have_account_text.dart';
import 'package:budget_app/pages/Login/component/background.dart';
import 'package:budget_app/pages/components/rounded_button.dart';
import 'package:budget_app/pages/components/rounded_input_field.dart';
import 'package:budget_app/pages/components/rounded_password_field.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();

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
              // Text(
              //   "LOGIN",
              //   style: TextStyle(
              //     fontSize: 23,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 1.5,
              //     fontFamily: GoogleFonts.aBeeZee().fontFamily,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 25),
                child: SvgPicture.asset(
                  "assets/images/login_img.svg",
                  width: size.width * 0.9,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedInputFields(
                      controller: username,
                      hintText: 'Your Username',
                      onChanged: (value) {},
                      validate: (value) {
                        if (value != null && value.isEmpty) {
                          return "username can not be empty";
                        }
                        if (value != 'admin') {
                          return "Please enter correct username";
                        }
                      },
                    ),
                    RoundedPasswordField(
                      controller: password,
                      onChanged: (value) {},
                      validate: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password can't be empty";
                        }
                        if (value != 'admin') {
                          return "Please enter correct password";
                        }
                      },
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
