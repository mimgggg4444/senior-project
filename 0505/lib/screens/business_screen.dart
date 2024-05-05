import 'package:flutter/material.dart';
import '../navigation_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key, required this.navigationState});

  final NavigationState navigationState;

  @override
  Widget build(BuildContext context) {
    return Text(
      '이것은 비즈니스',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}