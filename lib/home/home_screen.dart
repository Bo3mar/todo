import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home/settings_tab.dart';
import 'package:todo/home/task_tab_list.dart';
import 'package:todo/my_theme.dart';
import '../my_theme.dart';
import '../provider/settings_provider.dart';
import 'add_task_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider=Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor: settingsProvider.isDarkMode()?MyThemeData.BackgroundDark:MyThemeData.Backgroundlight,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todolist),
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
          selectedItemColor: MyThemeData.primaryBluelight,
          unselectedItemColor: MyThemeData.red ,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.list),
            label: AppLocalizations.of(context)!.tasks),

            BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings),

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
        context: context, builder: (buildContext){
      return AddTaskBottomSheet();
    });
  }
  var tabs = [TaskTabList(),SettingsTab()];
}
