// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// /// 🔥 IMPORTANT: Background handler (top-level)
// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse response) {
//   print("🔙 Background notification tapped: ${response.payload}");
// }
//
// class NotificationService {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _local =
//   FlutterLocalNotificationsPlugin();
//
//   /// 🔥 INIT FUNCTION
//   Future<void> init() async {
//     /// 🔐 Request permission (FCM)
//     await _fcm.requestPermission();
//
//     /// 🔐 Android 13+ permission (LOCAL)
//     await _local
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();
//
//     /// 📱 Local notification initialization
//     const AndroidInitializationSettings androidSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings initSettings =
//     InitializationSettings(android: androidSettings);
//
//     await _local.initialize(
//       settings: initSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         print("🔔 Notification tapped (foreground): ${response.payload}");
//
//         /// 👉 Yahan navigation kar sakte ho
//         // navigatorKey.currentState?.pushNamed("/eventDetail");
//       },
//       onDidReceiveBackgroundNotificationResponse:
//       notificationTapBackground,
//     );
//
//     /// 📩 Get FCM token
//     String? token = await _fcm.getToken();
//     print("📲 FCM Token: $token");
//
//
//
//     /// 🔔 Foreground message handling
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("📩 message received: ${message.notification?.title}");
//
//       _showLocalNotification(
//         title: message.notification?.title,
//         body: message.notification?.body,
//         payload: message.data.toString(),
//       );
//     });
//
//     /// 🔗 App opened from notification (background)
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("🚀 App opened from notification");
//
//       /// 👉 Navigation handle karo
//     });
//
//     /// 🔁 App opened from terminated state
//     RemoteMessage? initialMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//
//     if (initialMessage != null) {
//       print("📲 Opened from terminated state");
//
//       /// 👉 Navigation handle karo
//     }
//   }
//
//   /// 🔥 SHOW LOCAL NOTIFICATION
//   Future<void> _showLocalNotification({
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//
//     const NotificationDetails details =
//     NotificationDetails(android: androidDetails);
//
//     await _local.show(
//       id: 0,
//      title:  title ?? "Notification",
//       body: body ?? "",
//       notificationDetails: details,
//       payload: payload,
//     );
//   }
// }