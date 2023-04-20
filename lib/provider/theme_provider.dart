import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.dark();
  ThemeData get themeData => _themeData;

  void toggleTheme() {
    final isDark = _themeData == ThemeData.dark();
    if(isDark) {
      _themeData = ThemeData.light();
    } else {
      _themeData = ThemeData.dark();
    }
    notifyListeners();
  }
}