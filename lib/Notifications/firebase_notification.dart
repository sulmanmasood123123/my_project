import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_project/main.dart';

class FireBaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    try {
      await firebaseMessaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          sound: true,
          carPlay: true,
          criticalAlert: true);
      final fcmToken = await firebaseMessaging.getToken();
      initPushedNotification();
      print("FCM Token ${fcmToken}");
    } catch (e) {
      print("Exception ${e.toString()}");
    }
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState!.pushNamed('Chat_screen', arguments: message);
  }

  Future<void> initPushedNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            sound: true, badge: true, alert: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackGroundNotification);
  }

  Future<void> handleBackGroundNotification(RemoteMessage message) async {
    print("Title ${message.notification!.title}");
  }
}
