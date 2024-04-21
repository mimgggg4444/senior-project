      // 카카오 계정 정보로 Firebase Authentication에 계정 생성 또는 로그인
      String email = user.kakaoAccount?.email ?? '';
      String password = user.id.toString(); // 카카오 ID를 비밀번호 대용으로 사용
      String displayName = user.kakaoAccount?.profile?.nickname ?? '';

      try {
        // Firebase Authentication에 계정 생성 또는 로그인 시도
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // 사용자 이름(닉네임) 설정
        await userCredential.user?.updateDisplayName(displayName);

        // 로그인 성공 처리
        Provider.of<UserModel>(context, listen: false).nickname = displayName;
        Provider.of<UserModel>(context, listen: false).email = email;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MainPage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // 이미 존재하는 이메일인 경우, 로그인 시도
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          // 로그인 성공 처리
          Provider.of<UserModel>(context, listen: false).nickname = displayName;
          Provider.of<UserModel>(context, listen: false).email = email;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        } else {
          debugPrint('Firebase Authentication 에러: ${e.code}');
        }
      } catch (e) {
        debugPrint('Firebase Authentication 에러: $e');
      }
    } catch (error) {
      debugPrint('카카오 로그인 실패 $error');
    }
  }
