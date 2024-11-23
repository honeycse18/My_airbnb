import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
}

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (ForgotPasswordController controller) {
        return Scaffold(
          appBar: CustomAppBarWidget(
            hasBackButton: true,
            title: 'Forgot Password?',
          ),
          body: SafeArea(
            child: CustomScaffoldBodyWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap20,
                  Text(
                    'Enter the email address associated with your account, and we’ll email you a link to reset your password.',
                    style: AppTextStyles.bodyRegularTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap20,
                  CustomTextFormField(
                    controller: controller.emailTextEditingController,
                    labelText: 'Email',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomStretchedButtonWidget(
              onTap: () {
                Get.toNamed(AppRoutes.updatePassword);
              },
              child: Text(
                'Send Reset Link',
                style: AppTextStyles.semiSmallXBoldTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
