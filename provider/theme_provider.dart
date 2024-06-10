import 'package:ocare/components/colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Color get specialTextColor =>
      _isDarkMode ? const Color(0xffE0E0E0) : Colors.black;

  Color get bothTextColor =>
      _isDarkMode ? const Color(0xffE0E0E0) : Colors.white;

  ThemeData get lightTheme => ThemeData(
        primaryColor: MyColors.primaryColor,
        primarySwatch: MyColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primaryColor: MyDarkColors.primaryColor,
        primarySwatch: MyDarkColors.primaryMaterialColor,
        scaffoldBackgroundColor: const Color(0xff333333),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xffE0E0E0)),
        ),
      );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
