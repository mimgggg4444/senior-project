import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:ocare/config/app_config.dart';
import 'package:ocare/models/user_model.dart';
import 'package:ocare/provider/theme_provider.dart';
import 'package:ocare/router/app_router.dart';
import 'package:ocare/screens/login_page.dart';
import 'package:ocare/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:intl/date_symbol_data_local.dart';

import 'calendarAndChart/providers/health_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  KakaoSdk.init(nativeAppKey: AppConfig.kakaoNativeKey);
  await FlutterLocalNotification.init();

  WidgetsFlutterBinding.ensureInitialized(); // 이 라인을 추가하세요
  // 언어설정(intl) 추가
  await initializeDateFormatting('ko_KR', null);

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
        ChangeNotifierProvider(
          create: (_) => HealthDataProvider(), // HealthDataProvider 추가
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
      )..initFromFirestore(), // initFromFirestore 메서드 호출
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return StreamBuilder<firebase_auth.User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // 사용자가 로그인한 상태
                return CalendarAndChart(child: child!); // CalendarAndChart로 감싸기
              } else {
                // 사용자가 로그인하지 않은 상태
                return const LoginPage();
              }
            },
          );
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
      ),
    );
  }
}

// 추가: CalendarAndChart 클래스 정의
class CalendarAndChart extends StatelessWidget {
  final Widget child;

  const CalendarAndChart({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
