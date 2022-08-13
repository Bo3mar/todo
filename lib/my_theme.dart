import 'package:flutter/material.dart';

class MyThemeData {

  static const Color primaryBlue  = Color(0XFF5D9CEC);
  static const Color Background = Color(0XFFDFECDB);
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC4B4B);
  static const Color black = Color(0XFF383838);
  static const Color white = Color(0XFFFFFFFF);

  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryBlue,
      elevation: 0,

    ),
        textTheme: TextTheme(
          headline3: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),   subtitle1: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),   bodyText1: TextStyle(
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryBlue,
          unselectedItemColor: white,
        ),




        // primaryColor: PrimaryLight,
        // scaffoldBackgroundColor: lightScaffoldBackground,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   selectedIconTheme: IconThemeData(
        //     size: 36,
        //     color: PrimaryLight
        //   ),
        //   unselectedIconTheme: IconThemeData(
        //     size: 36,
        //   ),
        // ),
        // textTheme: TextTheme(
        //   titleMedium: TextStyle(
        //     color: PrimaryLight,
        //     fontSize: 24,
        //     fontWeight: FontWeight.bold
        //   ),
        //   bodySmall: TextStyle(
        //     fontSize: 12,
        //     color: Colors.black
        //   ),
        //   bodyMedium: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold          )
        // )
      );

}