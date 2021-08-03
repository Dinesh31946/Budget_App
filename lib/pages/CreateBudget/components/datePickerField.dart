import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
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
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.4,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.date_range_outlined,
            color: Colors.indigo[250],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
