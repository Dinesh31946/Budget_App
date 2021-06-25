import 'package:budget_app/pages/Login/component/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputFields extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFields({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
      ),
    );
  }
}
