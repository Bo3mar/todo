import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_utils/firebase_utils.dart';
import'package:todo/home/task_item.dart';
import 'package:todo/my_theme.dart';
import '../model/task.dart';


class TaskTabList extends StatefulWidget {

  @override
  State<TaskTabList> createState() => _TaskTabListState();
}

class _TaskTabListState extends State<TaskTabList> {
  List<Task> taskList=[];
  @override
  Widget build(BuildContext context) {
    if(taskList.isEmpty){
    getTaskFromFireStore();}
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            showYears: true,
            leftMargin: 20,
            monthColor: MyThemeData.primaryBlue,
            dayColor: MyThemeData.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyThemeData.primaryBlue,
            dotsColor: Color(0xFF333a47),
            // selectableDayPredicate: (date) {
            //   return true;
            //   //   return !(date.weekday == DateTime.friday ||date.weekday==DateTime.saturday);
            // },
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (buildContext,index){
              return TaskItem(task:taskList [index]);
            },itemCount: taskList.length),
          )
        ],
      ),
    );
  }
  getTaskFromFireStore()async{
    QuerySnapshot<Task> querySnapshot= await getTaskCollection().get();
    taskList=querySnapshot.docs.map((doc) {
       return doc.data();
    }).toList();
    setState((){

    });
  }
}
