import 'package:budget_app/model/incomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IncomeDataCard extends StatefulWidget {
  const IncomeDataCard({
    Key? key,
    required this.data,
    required this.edit,
    required this.index,
    required this.delete,
  }) : super(key: key);
  final IncomeModel data;
  final Function edit;
  final Function delete;
  final int index;

  @override
  _IncomeDataCardState createState() => _IncomeDataCardState();
}

class _IncomeDataCardState extends State<IncomeDataCard> {
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
            child: ListTile(
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
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      widget.data.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo[600]),
                    ),
                  ),
                  Text(
                    widget.data.desc!,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
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
      },
    );
  }
}
