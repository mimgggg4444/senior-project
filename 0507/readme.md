### 로그인 로직 연결 firestore에 데이터 auth인증된 사용자한해서 데이터 저장할 수 있게


- branch login
- branch merge =>



1. **main.dart**
   - MaterialApp에서 초기 라우트를 LoginPage로 설정
   - ChangeNotifierProvider를 사용하여 UserData Provider를 제공

2. **screens/login_page.dart**
   - Firebase Authentication을 사용하여 로그인 기능 구현
   - 로그인 성공 시, 사용자의 uid를 UserData Provider에 저장
   - 로그인 성공 후에는 HomeScreen 또는 ProfileScreen으로 이동

3. **providers/user_data.dart**
   - 사용자의 uid를 저장하는 변수를 정의
   - 사용자 데이터를 저장하고 읽을 수 있는 메서드를 구현

4. **screens/profile_screen.dart**
   - 사용자 데이터를 표시하고 편집할 수 있는 폼을 구현
   - 데이터 저장 시, UserData Provider의 uid를 사용하여 해당 사용자의 데이터를 저장

5. **services/firebase_service.dart**
   - Firestore에서 사용자 데이터를 읽고 쓰는 메서드를 구현
   - 데이터를 저장할 때는 uid를 문서 ID로 사용하여 각 사용자의 데이터를 구분

6. **models/user_model.dart**
   - 사용자 데이터를 저장할 UserModel 클래스를 정의
   - uid 필드를 포함하여 저장할 데이터를 정의

### 구현 순서

1. UserModel 클래스 정의
2. FirebaseService에서 Firestore 읽기/쓰기 메서드 구현
3. UserData Provider에서 uid 저장 및 사용자 데이터 읽기/쓰기 메서드 구현
4. LoginPage에서 Firebase Authentication 로그인 구현 및 uid 저장
5. ProfileScreen에서 사용자 데이터 폼 구현 및 데이터 읽기/쓰기 기능 구현

---
---

### 파일트리
```
.
├── components
│   └── colors.dart
├── config
│   └── firebase_options.dart
├── constants
│   └── constants.dart
├── controllers
│   └── user_controller.dart
├── main.dart
├── models
│   ├── friend_kakao.dart
│   ├── picker_item.dart
│   ├── user_model.dart
│   └── user_model.dart
├── navigation_state.dart
├── provider
│   ├── theme_provider.dart
│   └── user_data.dart
├── router
│   └── app_router.dart
├── screens
│   ├── business_screen.dart
│   ├── home_screen.dart
│   ├── login_page.dart
│   ├── main_page.dart
│   ├── profile_screen.dart
│   └── splash
│       └── splash_page.dart
├── services
│   └── firestore_service.dart
├── temple
│   └── temple.dart
├── utils
│   └── font_styles.dart
└── widgets
    ├── app_bar.dart
    ├── bottom_nav.dart
    ├── bottom_nav_bar.dart
    ├── bottom_navigation_bar.dart
    ├── text_field_with_controller.dart
    └── user_box.dart
```


- `config` 디렉토리에 `firebase_options.dart` 파일이 추가되었습니다.
- `controllers` 디렉토리에 `user_controller.dart` 파일이 추가되었습니다.
- `models` 디렉토리에 `user_model.dart` 파일이 추가되었습니다.
- `provider` 디렉토리에 `user_data.dart` 파일이 추가되었습니다.
- `router` 디렉토리에 `app_router.dart` 파일이 추가되었습니다.
- `screens` 디렉토리에 `business_screen.dart`, `home_screen.dart`, `profile_screen.dart` 파일이 추가되었습니다.
- `services` 디렉토리에 `firestore_service.dart` 파일이 추가되었습니다.
- `widgets` 디렉토리에 `app_bar.dart`, `bottom_nav.dart`, `bottom_nav_bar.dart`, `bottom_navigation_bar.dart`, `text_field_with_controller.dart`, `user_box.dart` 파일이 추가되었습니다.

---

파일 추가후 수정해야할 파일 목록

1. **main.dart**
   - `routes` 속성에 `ProfileScreen` 등의 새로운 화면을 추가
   - `initialRoute`를 `LoginPage`로 설정
   - `ChangeNotifierProvider`를 사용하여 `UserData` Provider를 제공

2. **screens/login_page.dart**
   - Firebase Authentication을 사용하여 로그인 기능을 구현
   - 로그인 성공 시, 사용자의 uid를 `UserData` Provider에 저장
   - 로그인 성공 후, `HomeScreen` 또는 `ProfileScreen`으로 이동

3. **screens/profile_screen.dart**
   - 사용자 데이터를 표시하고 편집할 수 있는 폼을 구현
   - 데이터 저장 시, `UserData` Provider의 uid를 사용하여 해당 사용자의 데이터를 저장

4. **providers/user_data.dart**
   - 사용자의 uid를 저장하는 변수를 정의
   - 사용자 데이터를 저장하고 읽을 수 있는 메서드를 구현

5. **services/firebase_service.dart**
   - Firestore에서 사용자 데이터를 읽고 쓰는 메서드를 구현
   - 데이터를 저장할 때는 uid를 문서 ID로 사용하여 각 사용자의 데이터를 구분

6. **models/user_model.dart**
   - 사용자 데이터를 저장할 `UserModel` 클래스를 정의
   - uid 필드를 포함하여 저장할 데이터를 정의

7. **router/app_router.dart**
   - `ProfileScreen` 등의 새로운 화면을 라우터에 추가

  

8. **widgets/text_field_with_controller.dart**
   - 사용자 데이터를 입력할 수 있는 TextFormField 위젯을 구현




---
---
main에서 provider가져왔는데, user_data.dart에서 정리된 데이터 가져오게 하는 방법 파악 요청

``` dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:ocare/config/app_config.dart';
import 'package:ocare/models/user_model.dart';
import 'package:ocare/provider/theme_provider.dart';
import 'package:ocare/screens/home_screen.dart';
import 'package:ocare/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: AppConfig.kakaoNativeKey);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => UserModel(
            name: '',
            id: '',
            age: 0,
            weight: 0,
            guardian: '',
            systolic: 0,
            diastolic: 0,
            bloodSugar: 0,
            nickname: '',
            email: '',
          ),
        ),
        // 다른 Provider들을 여기에 추가
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(
        name: '',
        id: '',
        age: 0,
        weight: 0,
        guardian: '',
        systolic: 0,
        diastolic: 0,
        bloodSugar: 0,
        nickname: '',
        email: '',
      ),
      child: MaterialApp(
        home: StreamBuilder<firebase_auth.User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // 사용자가 로그인한 상태
              return const HomeScreen();
            } else {
              // 사용자가 로그인하지 않은 상태
              /// 로그인 후에 mainpage가 바로뜸. 그후 껏다가 키면 homescreen이 뜸.
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}


```



