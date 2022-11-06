import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// First Step only for iOS

Future<void> requestNotificationsPermission() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  NotificationSettings notificationSetting =
      await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    sound: true,
  );

  switch (notificationSetting.authorizationStatus) {
    case (AuthorizationStatus.authorized):
      print('granted');
      break;
    default:
      print('not granted');
      break;
  }
}

///Second Step

void firebaseListen() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  });
}

Future<void> getFirebaseToken() async {
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });
}

void initNotifications() {
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification),
  );
  FlutterLocalNotificationsPlugin().initialize(initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  print(title);
  print(body);
}

void onDidReceiveNotificationResponse(NotificationResponse details) {}
