import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String _name = '테스트님';
  int _bloodPressure = 120;
  int _bloodSugar = 70;
  String _nickname = ''; // 닉네임 필드 추가
  String _email = ''; // 이메일 필드 추가
  List<String> _friends = []; // friends 필드 추가
  String get name => _name;

  int get bloodPressure => _bloodPressure;

  int get bloodSugar => _bloodSugar;

  String get nickname => _nickname; // 닉네임 getter 추가
  String get email => _email; // 이메일 getter 추가
  List<String> get friends => _friends; // friends getter 추가

  void updateUserData(
    String name,
    int bloodPressure,
    int bloodSugar,
    String nickname, // 닉네임 파라미터 추가
    String email, // 이메일 파라미터 추가
    List<String> friends, // friends 파라미터 추가
  ) {
    _name = name;
    _bloodPressure = bloodPressure;
    _bloodSugar = bloodSugar;
    _nickname = nickname; // 닉네임 업데이트
    _email = email; // 이메일 업데이트
    _friends = friends; // friends 업데이트

    notifyListeners();
  }
}
