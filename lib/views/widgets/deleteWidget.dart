import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:secondapp/Providers/provider.dart';
import 'package:secondapp/models/task_model.dart';

class DeleteWidget extends StatelessWidget {
   TaskModel taskModel;
   DeleteWidget(this.taskModel);

  @override
  Widget build(BuildContext context) {
    
     return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CheckboxListTile(
        value: false,
        onChanged: (v) {
          Provider.of<DBProvider>(context, listen: false)
              .deleteTasks(taskModel);
        },
        title: Text(taskModel.title!),
      ),
    );
    
  }
}