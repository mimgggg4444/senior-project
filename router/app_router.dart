import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ocare/calendarAndChart/screens/chart_page.dart';
import 'package:ocare/screens/page/user_detail.dart';
import '../calendarAndChart/screens/calendar_page.dart';
import '../calendarAndChart/screens/profile-calendar-chart.dart';
import '../screens/business_screen.dart';
import '../screens/home_screen.dart';
import '../screens/main_page.dart';
import '../screens/page/notification_list_page.dart';
import '../screens/profile_screen.dart';
import '../screens/splash/splash_page.dart';
import '../widgets/bottom_nav_bar.dart';

final router = GoRouter(
  initialLocation: AppScreen.splash,
  routes: [
    GoRoute(
      path: AppScreen.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true, // 바텀 네비게이션 바 뒤로 body를 추가
          body: child,

          bottomNavigationBar: BottomNavBar(
            currentIndex: _calculateSelectedIndex(state.uri.toString()),
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppScreen.business,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const BusinessScreen(),
          ),
        ),
        GoRoute(
          path: AppScreen.home,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppScreen.profile,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
          ),
        ),


        // notification list page

        GoRoute(
          path: AppScreen.userDetail,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const UserDetail(),
          ),
        ),
      ],

    ),

    //개별 분리 위해 shellroute 밖에 선언. navigationbar 안보이게.
    GoRoute(
      path: AppScreen.calendarPage,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const CalendarPage(),
      ),
    ),
    GoRoute(
      path: AppScreen.chartPage,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ChartPage(),
      ),
    ),
    GoRoute(
      path: AppScreen.notificationList,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const NotificationListPage(),
      ),
    ),
    GoRoute(
      path: AppScreen.mainPage,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const MainPage(),
      ),
    ),
    GoRoute(
      path: AppScreen.calendarAndChart,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const calendarAndChart(),
      ),
    ),

  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Not found'),
    ),
  ),
  debugLogDiagnostics: true,
);

class AppScreen {
  static String splash = '/splash';
  static String home = '/home';
  static String business = '/business';
  static String profile = '/profile';
  static String input = '/input';
  static String mainPage = '/mainPage';
  static String notificationList = '/notificationList';
  static String calendarAndChart = '/calendarAndChart';

  // 하위 페이지
  static String calendarPage = '/calendarPage';
  static String chartPage = '/chartPage';
  static String userDetail = '/userDetail';
}

int _calculateSelectedIndex(String location) {
  return [AppScreen.business, AppScreen.home, AppScreen.profile]
      .indexOf(location);
}
