import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DistanceInputScreen extends StatefulWidget {
  const DistanceInputScreen({Key? key}) : super(key: key);

  @override
  State<DistanceInputScreen> createState() => _DistanceInputScreenState();
}

class _DistanceInputScreenState extends State<DistanceInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home",
        ),
      ),
    );
  }
}
