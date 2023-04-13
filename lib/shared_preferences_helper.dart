import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String IS_DARK_MODE_ACTIVE = 'isDarkModeActive';

  static Future<bool> isDarkModeActive() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_DARK_MODE_ACTIVE) ?? false;
  }

  static Future<void> setDarkModeActive(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(IS_DARK_MODE_ACTIVE, value);
  }
}
