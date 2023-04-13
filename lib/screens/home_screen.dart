import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'distanceinput_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkModeActive = false;

  void toggleDarkMode() {
    setState(() {
      isDarkModeActive = !isDarkModeActive;
    });
  }

  void _onGetStartedPressed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double iconSize = screenSize.width * 0.07;
    final double titleFontSize = screenSize.width * 0.08;
    final double messageFontSize = screenSize.width * 0.05;
    final double buttonWidth = screenSize.width * 0.8;
    final double buttonHeight = screenSize.height * 0.07;
    final double imageWidth = screenSize.width;
    final double imageHeight = screenSize.height;
    final double headerPadding = screenSize.width * 0.06;
    final double buttonPadding = screenSize.width * 0.08;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkModeActive ? Color(0xff191a1b) : Color(0xffedf1f5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(headerPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/walkmatelogo.png'),
                      width: imageWidth * 0.3,
                      //fit: BoxFit.cover,
                    ),
                    IconButton(
                      icon: const Icon(Icons.incomplete_circle_rounded),
                      iconSize: iconSize,
                      color: Color(0xff20c56c),
                      onPressed: toggleDarkMode,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(headerPadding),
              child: Text(
                'Set your walking \ngoal today!',
                style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  color: isDarkModeActive ? Colors.white : Colors.black
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: imageWidth,
                //height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: isDarkModeActive ? AssetImage('assets/images/Dark_Image.png') : AssetImage('assets/images/Image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, buttonPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _onGetStartedPressed();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => DistanceInputScreen()));
                        },
                        child: Text(
                            'Get Started',
                          style: TextStyle(
                            fontSize: messageFontSize,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonHeight / 2),
                          ),
                          backgroundColor: const Color(0xff20c56c),
                          minimumSize: Size(buttonWidth * 1.1, buttonHeight),
                          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06, vertical: screenSize.height * 0.02),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
