import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider with ChangeNotifier{
  //variable create theme
  ThemeMode _themeMode=ThemeMode.light;
  //get variable
  ThemeMode get themeMode=>_themeMode;

  //set theme function
  setTheme(ThemeMode themeMode){
    _themeMode=themeMode;
  }
}