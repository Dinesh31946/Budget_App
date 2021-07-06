import 'package:budget_app/pages/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account ?",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpPage();
                },
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[250],
            ),
          ),
        )
      ],
    );
  }
}
