import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLang = 'en';
  static ThemeMode currentTheme = ThemeMode.light;

  void changeLanguage(String newLang) {
    if (currentLang == newLang) {
      return;
    }
    currentLang = newLang;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (currentTheme == newMode) {
      return;
    }
    currentTheme = newMode;
    notifyListeners();
  }
  bool isDarkMode(){
    return currentTheme==ThemeMode.dark?true:false;
  }
}