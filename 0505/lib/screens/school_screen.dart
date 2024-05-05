import 'package:flutter/material.dart';
import '../navigation_state.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 2: School',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}