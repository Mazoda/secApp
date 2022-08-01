import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:secondapp/data/DpHelper.dart';
import 'package:secondapp/models/task_model.dart';
import 'package:secondapp/views/screens/AllTasks.dart';
import 'package:secondapp/views/screens/addTask.dart';

import 'dart:math' as math;

import 'package:sqflite/sqflite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  ajfjasf() {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("hieght: " "$hieght");
    // ignore: avoid_print
    print("width: " "$width");
  }

  colorss(Value) {
    Color random = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    switch (Value) {
      case "Work":
        return Colors.blue;
      case "Personal":
        return Colors.teal;
      case "Shopping":
        return Colors.purple;
      case "Health":
        return Colors.red.shade400;
      case "Others":
        return Colors.purple.shade900;
      default:
        return random;
    }
  }
  List<TaskModel> tasks = [];
  @override
  void initState() {
    super.initState();
  }

  String name = "Oday";
  int taskNum = 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,actions: [
            IconButton(
                onPressed: () {
                  if (context.locale.toString() == "AR") {
                    context.setLocale(Locale("en"));
                  } else {
                    context.setLocale(Locale("AR"));
                  }
                },
                icon: Icon(Icons.language))
          ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Oday Mutlak"),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 148, 236, 251)),
              accountEmail: Text("oabumutlak@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/WorkDannyJones.png"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              subtitle: Text("Go to home"),
              title: Text("Home"),
            ),
            ListTile(
              leading: const Icon(Icons.add_task),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              subtitle: Text("Add Tasks"),
              title: Text("New Task"),
            ),
            ListTile(
              leading: const Icon(Icons.task),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              subtitle: Text("Go to Tasks"),
              title: Text("Completed Tasks"),
            ),Spacer(),
            Text("Version: 1.1.0",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),SizedBox(height: 30.h,)
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.png"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 50.w, top: 10),
              padding: EdgeInsets.only(top: 70.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Hey ".tr() + name,
                        style: TextStyle(
                            fontSize: 36.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 130.w,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTask(),
                                ));
                          },
                          icon: Image.asset("assets/images/add.png"))
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Today you have " "$taskNum" " Tasks",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    child: Row(
                      children: [
                        GestureDetector(
                         onTap:() {
                           
                         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context){
                                      return  AllTasks(Tasks: Tasks);
                                      }
                                         
                                          ));
                                          },
                          child: Container(
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.amber.withOpacity(0.5)),
                            child: Column(
                              children: [
                                Text(
                                  createdTasks()
                                  ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text("Tasks Created".tr())
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80.w,
                        ),
                        Container(
                          width: 120.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 187, 0, 255)
                                  .withOpacity(0.5)),
                          child: Column(
                            children: [
                              Text("12"),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text("Tasks Left".tr())
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 2,
                        width: 318.w,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Wiget1("Work", 7),
                      SizedBox(
                        width: 20.w,
                      ),
                      Wiget1("Personal", 2)
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Wiget1("Shopping", 2),
                      SizedBox(
                        width: 20.w,
                      ),
                      Wiget1("Health", 2)
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18),
              child: SizedBox(
                height: 400.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("8:00 AM", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          widget2("Do yoga", "15 minutes")
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text("9:00 AM", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          widget2("School homeWork", "Math, ex 3,page 150")
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text("9:30 AM", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          widget2("Course", "Watch Course on Udemy")
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text("6:45 PM", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          widget2("Visit", "Vist My Friend")
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text("8:00 PM", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          widget2("Groceries", "Buy Some Stuff")
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
            // ListView.builder(itemBuilder:  (context, index) {
          ],
        )),
      ),
    );
  }
}

class Wiget1 extends StatelessWidget {
  colorss(Value) {
    Color random = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    switch (Value) {
      case "Work":
        return Colors.blue;
      case "Personal":
        return Colors.teal;
      case "Shopping":
        return Colors.purple;
      case "Health":
        return Colors.red;
      case "Others":
        return Colors.purple.shade900;
      default:
        return random;
    }
  }

  String? taskType;
  int? num;
  Wiget1(this.taskType, this.num);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 60, 255).withOpacity(0.06),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0.0, 0.75) // changes position of shadow
                ),
          ],
        ),
        width: 150.w,
        height: 90.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 15.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$taskType".tr(),
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold))),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$num Tasks".tr(),
                      style: TextStyle(fontSize: 18.sp))),
            ),
          ],
        ),
      ),
      Positioned(
          left: 120.w,
          top: 10.h,
          child: Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                color: colorss(taskType),
              ))),
    ]);
  }
}

class widget2 extends StatelessWidget {
  String? taskType;
  String? caption;
  widget2(this.taskType, this.caption);
  @override
  Widget build(BuildContext context) {
    Color random = Color((math.Random().nextDouble() * 0xFFFFFF).toInt());
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 0, 60, 255).withOpacity(0.06),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0.0, 0.75) // changes position of shadow
                ),
          ],
        ),
        width: 270.w,
        height: 90.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 15.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$taskType".tr(),
                      style: TextStyle(fontSize: 20.sp))),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, top: 10.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text("$caption".tr(), style: TextStyle(fontSize: 18.sp))),
            ),
          ],
        ),
      ),
      Positioned(
          right: 20,
          top: 10.h,
          child: Container(
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                color: Colors.black.withOpacity(0.4),
              ))),
    ]);
  }
}
