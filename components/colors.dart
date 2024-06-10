import 'package:flutter/material.dart';

class MyColors {
  static const int _primaryColorValue = 0xFF276AEE;
  static const primaryColor = Color(_primaryColorValue);

  static const MaterialColor primaryMaterialColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_primaryColorValue), // 주 색상
      600: Color(0xFF007BFF), // Loading
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}

class MyDarkColors {
  static const int _primaryColorValue = 0xFF424242; // 적절한 어두운 회색
  static const primaryColor = Color(_primaryColorValue);
  static const MaterialColor primaryMaterialColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFE8E8E8),
      100: Color(0xFFD1D1D1),
      200: Color(0xFFBBBBBB),
      300: Color(0xFFA4A4A4),
      400: Color(0xFF8E8E8E),
      500: Color(_primaryColorValue),
      600: Color(0xFF3E3E3E),
      700: Color(0xFF383838),
      800: Color(0xFF323232),
      900: Color(0xFF262626),
    },
  );
}
