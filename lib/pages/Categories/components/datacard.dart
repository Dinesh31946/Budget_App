import 'package:budget_app/model/categoryModel.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    var parentId = widget.data.parentId.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Card(
        child: ExpansionTile(
          title: Text(
            widget.data.name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.indigo[600]),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description:" + widget.data.desc,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () {
                          showDeleteDialogue();
                        },
                        icon: Icon(Icons.delete, color: Colors.red)),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Parent Category: $parentId",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          trailing: CircleAvatar(
            maxRadius: 15,
            child: IconButton(
              onPressed: () {
                widget.edit(widget.index);
              },
              icon: Icon(Icons.edit, color: Colors.white, size: 15),
            ),
          ),
        ),
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
                style: ElevatedButton.styleFrom(minimumSize: Size(30, 30)),
                onPressed: () {
                  widget.delete(widget.index);
                },
                child: Text("Delete"),
              )
            ],
          );
        });
  }
}
