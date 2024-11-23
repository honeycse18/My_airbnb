import 'package:airbnb_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    getUser();
  }

  void getUser() async {
    Get.offNamed(AppRoutes.welcome);
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Image(
                image: const AssetImage('assets/images/banner.png'),
                width: Get.width * 0.7,
              ),
            ),
          ),
        );
      },
    );
  }
}
