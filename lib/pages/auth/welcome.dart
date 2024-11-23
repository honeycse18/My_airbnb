import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  //   with SingleGetTickerProviderMixin {
  // late AnimationController controller;
  // late Animation<double> animationScale;
  // late Animation<double> animationRotation;

  @override
  void onInit() {
    super.onInit();

    // Initialize the AnimationController
    // controller = AnimationController(
    //   duration: const Duration(seconds: 2),
    //   vsync: this,
    // )..repeat(reverse: true);

    // // Create a scaling animation
    // animationScale = Tween<double>(begin: 0.8, end: 1.2).animate(
    //   CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    // );

    // // Create a rotating animation
    // animationRotation =
    //     Tween<double>(begin: 0.0, end: 2 * 3.141592653589793).animate(
    //   CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    // );
  }

  // @override
  // void onClose() {
  //   controller.dispose();
  //   super.onClose();
  // }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WelcomeController(),
      builder: (WelcomeController controller) {
        return Scaffold(
            body: SafeArea(
                child: CustomScaffoldBodyWidget(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppGaps.hGap16,
                    Image(
                      image: const AssetImage('assets/images/intro_logo.png'),
                    ),
                    Text(
                      'Appstick home',
                      style: AppTextStyles.titlesemiSmallMediumTextStyle
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
                child: Text(
                  'Get Started',
                  style: AppTextStyles.semiSmallXBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
