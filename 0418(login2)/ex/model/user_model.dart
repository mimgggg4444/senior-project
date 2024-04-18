import 'package:flutter/foundation.dart';

class UserModel with ChangeNotifier {
  String nickname;
  String profileimage;

  UserModel({required this.nickname, required this.profileimage});
}
