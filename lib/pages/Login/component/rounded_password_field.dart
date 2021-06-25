import 'package:budget_app/pages/Login/component/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
      ),
    );
  }
}
