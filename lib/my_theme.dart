import 'package:flutter/material.dart';

class MyThemeData {

  static const Color primaryBluelight  = Color(0XFF5D9CEC);
  static const Color primaryBlueDark  = Color(0XFF5D9CEC);
  static const Color Backgroundlight = Color(0XFFDFECDB);
  static const Color BackgroundDark = Color(0XFF060E1E);
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC4B4B);
  static const Color black = Color(0XFF383838);
  static const Color white = Color(0XFFFFFFFF);

  static final ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryBluelight,
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
          selectedItemColor: primaryBluelight,
          unselectedItemColor: black,
        ),
      );

  static final ThemeData darkMode = ThemeData(

    appBarTheme: AppBarTheme(
      color: primaryBlueDark,
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
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedItemColor: primaryBlueDark,
    //   unselectedItemColor: black,
    // ),

  );

}