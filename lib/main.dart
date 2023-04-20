import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_mate/provider/theme_provider.dart';
import 'package:walk_mate/screens/distanceinput_screen.dart';
import 'package:walk_mate/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          final provider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.themeData,
            home: isFirstTime ? HomeScreen() : DistanceInputScreen(),
          );
        },
      ),
    ),
  );
}


