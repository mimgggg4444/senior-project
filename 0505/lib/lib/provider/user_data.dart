import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String _name = '테스트님';
  int _bloodPressure = 120;
  int _bloodSugar = 70;

  String get name => _name;

  int get bloodPressure => _bloodPressure;

  int get bloodSugar => _bloodSugar;

  void updateUserData(String name, int bloodPressure, int bloodSugar) {
    _name = name;
    _bloodPressure = bloodPressure;
    _bloodSugar = bloodSugar;
    notifyListeners();
  }
}
