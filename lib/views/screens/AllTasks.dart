import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:secondapp/Providers/provider.dart';
import 'package:secondapp/models/task_model.dart';
import 'package:secondapp/views/widgets/Task.dart';

class AllTasks extends StatefulWidget {
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel>? tasks = Provider.of<DBProvider>(context).selectAllTasks();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backg.png"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: 100,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Spacer(),
                  Image.asset(
                    "assets/images/search.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 400,
            height: 100,
            child: Image.asset(
              "assets/images/Group1.png",
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.tasks.length,
                itemBuilder: (context, index) {
                  return Task(taskmodel: widget.Tasks[index]);
                }),
          )
        ]),
      ),
    );
  }
}
