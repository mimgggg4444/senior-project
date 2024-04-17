import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  Future<void> initLoginService(BuildContext context) async {
    try {
      var token = await UserApi.instance.loginWithKakaoTalk();
      debugPrint('카카오 로그인 성공, 액세스 토큰: ${token.accessToken}');

      // 카카오 사용자 정보 가져오기
      var user = await UserApi.instance.me();

      // Firebase에 사용자 로그인
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCustomToken(token.accessToken);

      // 로그인 성공 시 사용자 정보 저장
      if (userCredential.user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLogged', true);

        // Provider를 사용하여 사용자 정보 공유
        Provider.of<UserModel>(context, listen: false).nickname = user.kakaoAccount?.profile?.nickname ?? '';
        Provider.of<UserModel>(context, listen: false).profileimage = user.kakaoAccount?.profile?.profileImageUrl ?? '';

        // 메인 페이지로 이동
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {
        // Firebase에 사용자 로그인 실패
        throw ('Firebase에 사용자 로그인 실패');
      }
    } catch (error) {
      debugPrint('카카오 로그인 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('카카오 로그인'),
          onPressed: () {
            initLoginService(context);
          },
        ),
      ),
    );
  }
}
