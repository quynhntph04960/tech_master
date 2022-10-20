import 'package:firebase_messaging/firebase_messaging.dart';

class FCMManager {
  static final _service = FCMManager._internal();
  factory FCMManager() => _service;
  FCMManager._internal();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    messaging.getToken().then((value) {
      print("Token: $value");
      listen();
    });
  }

  void listen() {
    // foreground message
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('** foreground notification: ${message.notification?.body}');
      }
    });

    // background message
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("onMessageOpenedApp");
      print("message data : ${message.data}");
      if (message.notification != null) {
        print("*** background notification ${message.notification?.body}");
      }
    });

    //out app
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("getInitialMessage");
      if (message?.notification != null) {
        print("*** out app notification ${message?.notification?.body}");
      }
    });
  }
}

final fcm = FCMManager();
