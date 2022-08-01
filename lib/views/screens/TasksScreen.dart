import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:secondapp/views/screens/AllTasks.dart';
import 'package:secondapp/views/screens/completeTasks.dart';
import 'package:secondapp/views/screens/deleteTasks.dart';
import 'package:secondapp/views/screens/incompletetasks.dart';

class MainTodoPage extends StatefulWidget {
  @override
  State<MainTodoPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainTodoPage>
    with SingleTickerProviderStateMixin {
  List alltasks = [];
  List completeTasks = [];
  List incompleteTasks = [];

  TabController? tabController;
  initTabBar() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        bottom: TabBar(controller: tabController!, tabs: const [
          Tab(
            icon: Icon(Icons.list),
          ),
          Tab(
            icon: Icon(Icons.done),
          ),
          Tab(
            icon: Icon(Icons.cancel),
          ),
          Tab(
            icon: Icon(Icons.delete),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => NewTaskScreen())));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasks(Tasks: [],),
        CompleteTasksScreen(),
        InCompleteTasksScreen(),
        deleteTasks()
      ]),
    );
  }
}
