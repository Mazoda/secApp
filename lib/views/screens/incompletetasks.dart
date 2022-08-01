import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/provider.dart';

class InCompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: Provider.of<DBProvider>(context).InCompleteTasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(
              Provider.of<DBProvider>(context).InCompleteTasks[index]);
        });
  }
}
