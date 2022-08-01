import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../providers/provider.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider.of<DBProvider>(context).CompleteTasks.isEmpty
        ? Lottie.asset('assets/animations/empty.json')
        : ListView.builder(
            itemCount: Provider.of<DBProvider>(context).CompleteTasks.length,
            itemBuilder: (context, index) {
              return Task(
                  Provider.of<DBProvider>(context).CompleteTasks[index]);
            });
  }
}
