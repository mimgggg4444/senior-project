import 'package:flutter/material.dart';
import 'package:mainpagev1/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: HomeScreen(),
    );
  }
}