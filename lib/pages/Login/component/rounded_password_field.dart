import 'package:flutter/material.dart';

import 'package:budget_app/pages/Login/component/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.indigo[250],
            size: 18,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.indigo[250],
            size: 18,
          ),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "Password can't be empty";
          }
          if (value != 'admin') {
            return "Please enter correct password";
          }
        },
      ),
    );
  }
}
