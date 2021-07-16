import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/categoryModel.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';

class ShowDialouge extends StatefulWidget {
  @override
  _ShowDialougeState createState() => _ShowDialougeState();
}

class _ShowDialougeState extends State<ShowDialouge> {
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();

  TextEditingController subcategory = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late DB db;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.all(15),
      content: Container(
        height: 170,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Add Category"),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter Category Name Here...",
                    hintStyle: TextStyle(fontSize: 9.0),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Category name can not be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: subcategory,
                  decoration: InputDecoration(
                    labelText: "Subcategory Of",
                    hintText: "Enter Subcategory Name Here...",
                    hintStyle: TextStyle(fontSize: 9.0),
                  ),
                ),
                TextFormField(
                  controller: desc,
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Enter Description Name Here...",
                    hintStyle: TextStyle(fontSize: 9.0),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Category name can not be empty";
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              db.insertCategory(CategoryModel(
                name: name.text,
                desc: desc.text,
                createdTime: DateTime.now(),
                createdBy: 'Admin',
              ));

              Navigator.pop(context);
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            }
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
