
import 'package:secondapp/data/DpHelper.dart';

class TaskModel {
  int ?type_ID;
  int? id;
  String? taskType;
  String? Name;
  bool? isComplete;
  String? description;
  DateTime? date;
  TaskModel({
    this.taskType,
    required this.Name,
    this.isComplete = false,
    required this.description,
    required this.date
  });
  TaskModel.fromMap(Map<String, dynamic> json){
    id = json[DpHelper.taskId];
    Name = json[DpHelper.taskName];
    isComplete = json[DpHelper.taskIsComplete] == 1 ? true : false;
    description=json[DpHelper.taskDes];
    taskType=json[DpHelper.taskType];
  }

  copy(int id) {
    this.id = id;
  }

  Map<String, dynamic> toMap() {
    return  {
      DpHelper.taskName: Name,
      DpHelper.taskIsComplete: isComplete! ? 1 : 0,
      DpHelper.taskDes:description,
      DpHelper.taskdate:"${date!.hour} : ${date!.minute}"
    };
  }  ChangeIsComplete() {
    this.isComplete = !this.isComplete!;
  }
}