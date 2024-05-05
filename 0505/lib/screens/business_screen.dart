import 'package:flutter/material.dart';
import '../navigation_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 1: Business',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}