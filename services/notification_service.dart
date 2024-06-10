import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterLocalNotification {
  static Future<List<ActiveNotification>?> getActiveNotifications() async {
    return await flutterLocalNotificationsPlugin.getActiveNotifications();
  }

  FlutterLocalNotification._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static requestNotificationPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel id', 'channel name',
            channelDescription: 'channel description',
            importance: Importance.max,
            priority: Priority.max,
            showWhen: false);

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(badgeNumber: 1));

    await flutterLocalNotificationsPlugin.show(
        0, 'ocare 측정시간', '건강을 위해 측정하세요', notificationDetails);
  }

  static Future<void> saveNotifications(
      List<ActiveNotification> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = notifications
        .map((notification) => {
              'id': notification.id,
              'channelId': notification.channelId,
              'title': notification.title,
              'body': notification.body,
            })
        .toList();
    await prefs.setString('notifications', json.encode(notificationsJson));
  }

  static Future<List<ActiveNotification>> getSavedNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = prefs.getString('notifications');
    if (notificationsJson != null) {
      final notificationsList = json.decode(notificationsJson) as List<dynamic>;
      return notificationsList
          .map((notificationJson) => ActiveNotification(
                id: notificationJson['id'],
                channelId: notificationJson['channelId'],
                title: notificationJson['title'],
                body: notificationJson['body'],
              ))
          .toList();
    }
    return [];
  }
}
