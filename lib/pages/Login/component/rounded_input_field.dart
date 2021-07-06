import 'package:flutter/material.dart';

import 'package:budget_app/pages/Login/component/text_field_container.dart';

class RoundedInputFields extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputFields({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.indigo[250],
            size: 18,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return "username can not be empty";
          }
          if (value != 'admin@gmail.com') {
            return "Please enter correct email";
          }
        },
      ),
    );
  }
}
