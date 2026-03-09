import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request permission
    NotificationSettings settings = await _messaging.requestPermission();

    print("Permission: ${settings.authorizationStatus}");

    // Get device token
    String? token = await _messaging.getToken();

    print("FCM Token: $token");

    // Foreground notification listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received");

      print(message.notification?.title);
      print(message.notification?.body);
    });
  }
}
