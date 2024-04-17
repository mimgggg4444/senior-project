import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import 'main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void initLoginService(BuildContext context) async {
    try {
      var token = await UserApi.instance.loginWithKakaoTalk();
      debugPrint('카카오 로그인 성공, 액세스 토큰: ${token.accessToken}');

      // 카카오 액세스 토큰을 서버로 전송하고 Firebase Custom Token을 받아오는 과정 필요
      // String firebaseToken = await sendTokenToServer(token.accessToken);

      // Firebase Custom Token으로 Firebase 인증 진행
      // await FirebaseAuth.instance.signInWithCustomToken(firebaseToken);

      var user = await UserApi.instance.me();
      Provider.of<UserModel>(context, listen: false).nickname = user.kakaoAccount?.profile?.nickname ?? '';
      Provider.of<UserModel>(context, listen: false).profileimage = user.kakaoAccount?.profile?.profileImageUrl ?? '';

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
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
