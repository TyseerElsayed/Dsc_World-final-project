import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light:ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepOrangeAccent,
  ),
  AppTheme.dark:ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
  ),
};
