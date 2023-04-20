import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class DistanceInputScreen extends StatefulWidget {
  const DistanceInputScreen({Key? key}) : super(key: key);

  @override
  State<DistanceInputScreen> createState() => _DistanceInputScreenState();
}

class _DistanceInputScreenState extends State<DistanceInputScreen> {

  double _currentSliderValue = 0;

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

    final provider = Provider.of<ThemeProvider>(context);
    bool isDarkModeActive = provider.themeData.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkModeActive ? Color(0xff191a1b) : Color(0xffedf1f5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: Color(0xFF20C56C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(headerPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "WalkMate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: imageWidth * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                            //fit: BoxFit.cover,
                          ),
                          IconButton(
                            icon: const Icon(Icons.incomplete_circle_rounded),
                            iconSize: iconSize,
                            color: Colors.white,
                            onPressed: () {
                              provider.toggleTheme();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(headerPadding),
                    child: Text(
                      'Set Your Walking \nGoal Now!',
                      style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(headerPadding, 0, headerPadding, 0),
                    child: Text(
                      'Your determination and effort is \nstunning. Keep pushing yourself to reach \nnew heights.',
                      style: TextStyle(
                        fontSize: messageFontSize * 0.8,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.04,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SET TARGET DISTANCE",
                  style: TextStyle(
                    fontSize: messageFontSize! * 0.9,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.2
                  ),
                ),
                Slider(
                  activeColor: Colors.transparent,
                  inactiveColor: Colors.grey,
                  autofocus: true,
                  value: _currentSliderValue, // current values of the range slider
                  min: 0, // minimum value of the range slider
                  max: 10000, // maximum value of the range slider
                  divisions: 100,
                  onChanged: (value) {
                    print('Rangeslider onChanged: $value');
                    // callback function that gets called when the range slider values change
                    setState(() {
                      _currentSliderValue = value; // update the current values
                    });
                  },
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
