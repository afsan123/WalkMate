import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const String _themePref = "theme_pref";
  static const String _isDarkTheme = "is_dark_theme";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isDarkTheme, value);
  }

  Future<bool> isDarkTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkTheme) ?? false;
  }
}
