import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.size,
    required this.controller,
    required this.validate,
    required this.onTap,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validate;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.8,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
