import 'package:airbnb_app/routes/pages.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/theme/theme.dart';
import 'package:airbnb_app/utils/fcm.dart';
import 'package:airbnb_app/utils/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    void initFirebase() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseMessaging.instance.requestPermission(provisional: true);
      FCMHandler.init();
    }

    return GetMaterialApp(
      title: 'AirBnB',
      theme: appTheme(Brightness.light),
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.list,
      onInit: () {},
      onReady: () async {},
    );
  }
}
