import 'package:budget_app/model/categoryModel.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard(
      {Key? key,
      required this.data,
      required this.edit,
      required this.index,
      required this.delete})
      : super(key: key);
  final CategoryModel data;
  final Function edit;
  final Function delete;
  final int index;

  @override
  Widget build(BuildContext context) {
    var parentId = data.parentId.toString();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: IconButton(
                onPressed: () {
                  edit(index);
                },
                icon: Icon(Icons.edit)),
          ),
          title: Text(data.name),
          subtitle: Row(
            children: [
              Text(data.desc),
              SizedBox(
                width: 10,
              ),
              Text("Parent Id: $parentId"),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
                onPressed: () {
                  delete(index);
                },
                icon: Icon(Icons.delete, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
