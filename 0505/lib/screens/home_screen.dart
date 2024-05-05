import 'package:flutter/material.dart';
import '../navigation_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 0: Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}