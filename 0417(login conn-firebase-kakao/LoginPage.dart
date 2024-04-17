
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void initLoginService(BuildContext context) async {
    try {
      // 카카오 로그인
      var token = await UserApi.instance.loginWithKakaoTalk();
      debugPrint('카카오 로그인 성공, 액세스 토큰: ${token.accessToken}');

      // Firebase Authentication 인증
      final credential = KakaoAuthProvider.credential(
        accessToken: token.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // 사용자 정보 가져오기
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Provider.of<UserModel>(context, listen: false).nickname = user.displayName ?? '';
        Provider.of<UserModel>(context, listen: false).profileimage = user.photoURL ?? '';
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
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
