import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class deleteTasks extends StatefulWidget {
  @override
  State<deleteTasks> createState() => _deleteTasksState();
}

class _deleteTasksState extends State<deleteTasks> {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: Provider.of<DBProvider>(context).allTasks.length,
        itemBuilder: (context, index) {
          return DeleteWidget(Provider.of<DBProvider>(context).allTasks[index]);
        });
  }
}
