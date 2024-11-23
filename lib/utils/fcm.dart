import 'dart:convert';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'api.dart';

class FCMHandler {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static String? fcmToken;

  static updateFCMToken() async {
    fcmToken = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('FCM TOKEN: $fcmToken');
    }
    if (fcmToken != null && fcmToken!.isNotEmpty) {
      await ApiRequest.patch("/app-user/profile", {
        "pushToken": fcmToken,
      });
    }
  }

  static init() async {
    if (kDebugMode) {
      print('FCM INITIALIZED');
    }
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    void onNotificationTap(String payload) async {

    }

    var androidInit =
        const AndroidInitializationSettings('@mipmap/launcher_icon'); //for log

    void onDidReceiveLocalNotification(
        int id, String? title, String? body, String? payload) async {
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title ?? ''),
          content: Text(body ?? ''),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                onNotificationTap(payload ?? "");
              },
            )
          ],
        ),
      );
    }

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initSetting = InitializationSettings(
      android: androidInit,
      iOS: initializationSettingsDarwin,
    );
    FlutterLocalNotificationsPlugin fltNotification =
        FlutterLocalNotificationsPlugin();
    fltNotification.initialize(initSetting, onDidReceiveNotificationResponse:
        (NotificationResponse response) async {
      var payload = response.payload ?? "{}";
      if (kDebugMode) {
        print('Notification payload: $payload');
      }
      onNotificationTap(payload);
    });
    var androidDetails = const AndroidNotificationDetails(
      '1',
      'beautik',
      channelDescription: 'Beautik channel',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);

    /// while app is on
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
        print(message.data);
      }
      RemoteNotification? notification = message.notification;
      try {
        await fltNotification.show(
          0,
          notification?.title ?? "",
          notification?.body ?? "",
          generalNotificationDetails,
          payload: jsonEncode(message.data),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });

    /// on close notification tap
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
        print(message.data);
      }
      onNotificationTap(jsonEncode(message.data));
    });
  }

  static Future<void> backgroundMessageHandler(RemoteMessage message) async {}
}
