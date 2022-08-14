import 'package:flutter/material.dart';
import 'package:todo/home/settings.dart';
import 'package:todo/home/task_tab_list.dart';
import 'package:todo/my_theme.dart';
import 'add_task_bottom_sheet.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.Background,
      appBar: AppBar(
        title: Text('To Do List',),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10 ,
        child: BottomNavigationBar(
          onTap: (index){
            currentIndex=index ;
            setState(() {

            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),
            label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: 'Settings'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> showAddTaskBottomSheet(),
        child: Icon(Icons.add),
        shape: StadiumBorder(
            side: BorderSide(color: Colors.white,width: 4)
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void showAddTaskBottomSheet(){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context, builder: (buildcontext){
      return AddTaskBottomSheet();
    });
  }
  var tabs = [TaskTabList(),SettingsTab()];
}
