import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/task_item.dart';
import 'package:todo/my_theme.dart';
import '../provider/list_provider.dart';
import '../provider/settings_provider.dart';

class TaskTabList extends StatefulWidget {
  @override
  State<TaskTabList> createState() => _TaskTabListState();
}

class _TaskTabListState extends State<TaskTabList> {

late ListProvider listProvider ;
  @override
  Widget build(BuildContext context) {
    listProvider=Provider.of<ListProvider>(context);
    if(listProvider.taskList.isEmpty){
  listProvider.getTaskFromFireStore();
}
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: listProvider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              listProvider.changeSelectedDate(date);
            },
            showYears: true,
            leftMargin: 20,
            monthColor: SettingsProvider.currentTheme==ThemeMode.light?MyThemeData.primaryBluelight:MyThemeData.primaryBlueDark,
            dayColor: SettingsProvider.currentTheme==ThemeMode.light?MyThemeData.black:MyThemeData.white,
            activeDayColor: SettingsProvider.currentTheme==ThemeMode.light?MyThemeData.white:MyThemeData.black,
            activeBackgroundDayColor: MyThemeData.primaryBluelight,
            dotsColor:  const Color(0xFF333a47),
            // selectableDayPredicate: (date) {
            //   return true;
            //   //   return !(date.weekday == DateTime.friday ||date.weekday==DateTime.saturday);
            // },
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listProvider.taskList.length,
                itemBuilder: (context, index) {
                  return TaskItem(task: listProvider.taskList[index]);
                }),
          )
        ],
      ),
    );
  }


}
