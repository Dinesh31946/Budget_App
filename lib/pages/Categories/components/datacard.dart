import 'package:budget_app/Database/databaseHelper.dart';
import 'package:budget_app/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DataCard extends StatefulWidget {
  const DataCard({
    Key? key,
    required this.data,
    required this.edit,
    required this.index,
    required this.delete,
  }) : super(key: key);
  final CategoryModel data;
  final Function edit;
  final Function delete;
  final int index;

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  List<CategoryModel> subCategory = [];

  List<Widget> _categories = [];

  late DB db;

  @override
  void initState() {
    super.initState();
    db = DB();
    getSubCategory();
  }

  void getSubCategory() async {
    subCategory = await db.getSubCategory(widget.index);
    setState(() {
      subCategory.forEach((category) {
        _categories.add(ListTile(
          title: Text(category.name),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.5,
        child: Card(
          color: Colors.indigo[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo[600],
                child: Text(
                  widget.data.name[0],
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo[600]),
                  ),
                  Text(widget.data.desc!,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                ],
              ),
              children: [
                Column(
                  children: _categories,
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconSlideAction(
            caption: 'Edit',
            iconWidget: Icon(Icons.edit, color: Colors.blue[600]),
            onTap: () {
              widget.edit(widget.index);
            },
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            iconWidget: Icon(Icons.delete, color: Colors.red[600]),
            onTap: () {
              showDeleteDialogue();
            },
          ),
        ],
      ),
    );
  }

  void showDeleteDialogue() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Are you sure to delete this category?"),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(30, 30), primary: Color(10)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(30, 30)),
                onPressed: () {
                  widget.delete(widget.index);
                  Navigator.pop(context);
                },
                child: Text("Delete"),
              ),
            ],
          );
        });
  }
}
