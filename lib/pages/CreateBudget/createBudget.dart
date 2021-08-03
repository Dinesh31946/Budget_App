import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/budgetModel.dart';
import 'package:budget_app/pages/CreateBudget/components/datePickerField.dart';
import 'package:budget_app/pages/CreateBudget/components/inputField.dart';
import 'package:budget_app/pages/components/rounded_button.dart';
import 'package:budget_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateBudgetPage extends StatefulWidget {
  CreateBudgetPage({Key? key}) : super(key: key);

  @override
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  TextEditingController budgetNameController = TextEditingController();
  TextEditingController budgetDescController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController totalIncomeController = TextEditingController();
  TextEditingController totalExpenseController = TextEditingController();

  List<BudgetModel> budgets = [];

  final _formKey = GlobalKey<FormState>();

  late DB db;

  @override
  void initState() {
    super.initState();
    db = DB();
  }

  DateTime _selstrtDate = DateTime.now();
  DateTime _selendDate = DateTime.now().add(Duration(days: 30));

  Future<Null> _startDate(BuildContext context) async {
    final DateTime? _strtDate = await showDatePicker(
      context: context,
      initialDate: _selstrtDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((_strtDate) {
      if (_strtDate != null) {
        String _formattedStrtDate = DateFormat.yMMMd().format(_strtDate);
        startDateController.text = _formattedStrtDate;
      }
    });

    if (_strtDate != null) {
      setState(() {
        _selstrtDate = _strtDate;
      });
    }
  }

  Future<Null> _pickendDate(BuildContext context) async {
    final DateTime? _endDate = await showDatePicker(
      context: context,
      initialDate: _selendDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((_endDate) {
      if (_endDate != null) {
        String _formattedEndDate = DateFormat.yMMMd().format(_endDate);
        endDateController.text = _formattedEndDate;
      }
    });

    if (_endDate != null) {
      setState(() {
        _selendDate = _endDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String _formattedStrtDate = DateFormat.yMMMd().format(_selstrtDate);
    String _formattedEndDate = DateFormat.yMMMd().format(_selendDate);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Budget"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 178),
                    child: Text(
                      "Budget Name",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[600],
                      ),
                    ),
                  ),
                  InputField(
                    controller: budgetNameController,
                    size: size,
                    hintText: 'Budget Name..',
                    onChanged: (String value) {},
                    validate: (value) {
                      if (value != null && value.isEmpty) {
                        return "Budget Name can't be empty";
                      }
                    },
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 137),
                    child: Text(
                      "Budget Description",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[600],
                      ),
                    ),
                  ),
                  InputField(
                    controller: budgetDescController,
                    size: size,
                    hintText: 'Budget Description..',
                    onChanged: (String value) {},
                    validate: (value) {},
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 12),
                          Text(
                            "Start Date",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[600],
                            ),
                          ),
                          SizedBox(width: 80),
                          Text(
                            "End Date",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DatePickerField(
                            controller: startDateController,
                            size: size,
                            hintText: _formattedStrtDate.toString(),
                            onChanged: (String value) {},
                            validate: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please enter Start Date";
                              }
                            },
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _startDate(context);
                            },
                          ),
                          SizedBox(width: 5),
                          DatePickerField(
                            controller: endDateController,
                            size: size,
                            hintText: _formattedEndDate.toString(),
                            onChanged: (String value) {},
                            validate: (value) {
                              if (value != null && value.isEmpty) {
                                return "Please enter Start Date";
                              }
                            },
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _pickendDate(context);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 188),
                    child: Text(
                      "Total Income",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[600],
                      ),
                    ),
                  ),
                  InputField(
                    controller: totalIncomeController,
                    size: size,
                    hintText: 'Total Income..',
                    onChanged: (String value) {},
                    validate: (value) {},
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 188),
                    child: Text(
                      "Total Expense",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[600],
                      ),
                    ),
                  ),
                  InputField(
                    controller: totalExpenseController,
                    size: size,
                    hintText: 'Total Expense..',
                    onChanged: (String value) {},
                    validate: (value) {},
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  RoundedButton(
                    text: 'Save',
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        db.insertBudget(
                          BudgetModel(
                            name: budgetNameController.text,
                            desc: budgetDescController.text,
                            startDate: startDateController.text,
                            endDate: endDateController.text,
                            income: 0,
                            expense: 0,
                            createdTime: DateTime.now(),
                            createdBy: "Admin",
                          ),
                        );
                      }
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
