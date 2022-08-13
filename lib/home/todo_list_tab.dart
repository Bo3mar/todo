import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import'package:todo/home/task_item.dart';
import 'package:todo/my_theme.dart';


class TodoListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              return TaskItem();
            },itemCount: 20,),
          )
        ],
      ),
    );
  }
}
