import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/incomeModel.dart';
import 'package:budget_app/pages/Income/components/incomeDataCard.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:budget_app/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  List<IncomeModel> incomes = [];
  bool fetching = true;
  int currentIndex = 0;

  final _formKey = GlobalKey<FormState>();

  late DB db;

  @override
  void initState() {
    super.initState();
    db = DB();
    getIncome();
  }

  void getIncome() async {
    incomes = await db.getIncome();
    setState(() {
      fetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
      ),
      drawer: MyDrawer(),
      body: fetching
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: incomes.length,
              itemBuilder: (context, index) => IncomeDataCard(
                data: incomes[index],
                edit: edit,
                index: index,
                delete: delete,
              ),
            ),
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Add Income Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Income Source Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter Income Source Name";
                          }
                        },
                      ),
                      TextFormField(
                        controller: descController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
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
                        IncomeModel dataLocal = IncomeModel(
                          name: nameController.text,
                          desc: descController.text,
                          createdTime: DateTime.now(),
                          createdBy: 'Admin',
                        );

                        db.insertIncome(dataLocal);
                        // dataLocal.id = incomes[incomes.length - 1].id! + 1;
                        setState(() {
                          incomes.add(dataLocal);
                        });
                        nameController.clear();
                        descController.clear();
                        Navigator.pushNamed(context, MyRoutes.incomeRoute);
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

  void showUpdateDialouge() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(15),
            content: Container(
              margin: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Add Income Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Income Source Name Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter Income Source Name";
                          }
                        },
                      ),
                      TextFormField(
                        controller: descController,
                        decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description Here...",
                          hintStyle: TextStyle(fontSize: 9.0),
                        ),
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
                        IncomeModel newData = incomes[currentIndex];
                        newData.name = nameController.text;
                        newData.desc = descController.text;
                        db.updateIncome(newData, newData.id!);
                        setState(() {});

                        nameController.clear();
                        descController.clear();
                        Navigator.pop(context);
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

  void edit(index) {
    currentIndex = index;
    nameController.text = incomes[index].name;
    descController.text = incomes[index].desc!;
    showUpdateDialouge();
  }

  void delete(int index) {
    db.deleteCategory(incomes[index].id!);
    setState(() {
      incomes.removeAt(index);
    });
  }
}
