import 'package:flutter/cupertino.dart';
import 'package:secondapp/data/DpHelper.dart';
import 'package:secondapp/models/task_model.dart';

class DBProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> CompleteTasks = [];
  List<TaskModel> InCompleteTasks = [];
  DBProvider() {
    selectAllTasks();
  }
  fillTasks(List<TaskModel> allTasks, List<TaskModel> completeTasks,
      List<TaskModel> inCompleteTask) {
    this.allTasks = allTasks;
    this.CompleteTasks = completeTasks;
    this.InCompleteTasks = inCompleteTask;
    notifyListeners();
  }

  createNewTask(TaskModel taskModel) async {
    await DpHelper.dpHelper.insertOneTask(taskModel);
    selectAllTasks();
  }

  selectAllTasks() async {
    List<TaskModel> allTasks = await DpHelper.dpHelper.selectAllTask();
    List<TaskModel> allCompleteTasks =
        await DpHelper.dpHelper.selectCompletedTasks();
    List<TaskModel> allInCompleteTasks =
        await DpHelper.dpHelper.selectIncompletedTasks();

    fillTasks(allTasks, allCompleteTasks, allInCompleteTasks);
  }

  updateComplete(TaskModel taskModel) async {
    taskModel.ChangeIsComplete();
    await DpHelper.dpHelper.UpdateComplete(taskModel);
    selectAllTasks();
  }

  deleteTasks(TaskModel taskModel) async {
    await DpHelper.dpHelper.deleteTask(taskModel.id!);
    selectAllTasks();
  }

  getCount(var taskModel) async {
    await DpHelper.dpHelper.getCount();
  }
}
