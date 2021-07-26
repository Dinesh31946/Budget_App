import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/categoryModel.dart';
import 'package:budget_app/pages/Categories/components/datacard.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:budget_app/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController subcategory = TextEditingController();

  List<CategoryModel> categories = [];
  bool fetching = true;
  String dropdownValue = "Select Category";
  int currentIndex = 0;

  final _formKey = GlobalKey<FormState>();

  var _selectedValue;

  late DB db;

  @override
  void initState() {
    super.initState();
    db = DB();
    getCategory();
  }

  void getCategory() async {
    categories = await db.getCategory();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      drawer: MyDrawer(),
      body: fetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => DataCard(
                    data: categories[index],
                    edit: edit,
                    index: index,
                    delete: delete,
                  )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[600],
        onPressed: () {
          showDialouge();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialouge() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(15),
            content: Container(
              margin: EdgeInsets.zero,
              // height: 200,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Add Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Category Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter category name";
                          }
                        },
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: descController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: _selectedValue,
                        items: categories
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e.id,
                              ),
                            )
                            .toList(),
                        hint: Text("Parent Category"),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      nameController.clear();
                      descController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        CategoryModel dataLocal = CategoryModel(
                          name: nameController.text,
                          desc: descController.text,
                          parentId: _selectedValue,
                          createdTime: DateTime.now(),
                          createdBy: 'Admin',
                        );

                        db.insertCategory(dataLocal);

                        // this code is edited By: Dinesh Gosavi On: 23-07-2021
                        // this code was causing error to save data
                        // dataLocal.id =
                        //     categories[categories.length - 1].id! + 1;

                        setState(() {
                          categories.add(dataLocal);
                        });
                        nameController.clear();
                        descController.clear();

                        Navigator.pushNamed(context, MyRoutes.categoryRoute);
                      }
                    },
                    child: Text("Save"),
                  ),
                ],
              )
            ],
          );
        });
  }

  void showUpdateDialogue() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(15),
            content: Container(
              height: 200,
              width: 400,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Update Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Category Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter category name";
                          }
                        },
                      ),
                      TextFormField(
                        // maxLines: 5,
                        controller: descController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                      ),
                      DropdownButtonFormField(
                        value: _selectedValue,
                        items: categories
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e.id,
                              ),
                            )
                            .toList(),
                        hint: Text("Subcategory Of"),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      nameController.clear();
                      descController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        CategoryModel newData = categories[currentIndex];
                        newData.name = nameController.text;
                        newData.desc = descController.text;
                        newData.parentId = _selectedValue;
                        db.updateCategory(newData, newData.id!);
                        setState(() {});

                        nameController.clear();
                        descController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Update"),
                  ),
                ],
              )
            ],
          );
        });
  }

  void edit(index) {
    currentIndex = index;
    nameController.text = categories[index].name;
    descController.text = categories[index].desc!;
    _selectedValue = categories[index].parentId;
    showUpdateDialogue();
  }

  void delete(int index) {
    db.deleteCategory(categories[index].id!);
    setState(() {
      categories.removeAt(index);
    });
  }
}
