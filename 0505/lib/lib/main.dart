import 'package:bottomnavigationv1/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()

      // ChangeNotifierProvider(
      // create: (_) => UserData(),
      // child: MyApp(),
      // ),

  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}