import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  RxBool toggleHidePassword = true.obs;
  RxBool toggleHideConfirmPassword = true.obs;

}

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePasswordController>(
      init: UpdatePasswordController(),
      builder: (UpdatePasswordController controller) {
        return Scaffold(
          appBar: CustomAppBarWidget(
            hasBackButton: true,
            title: 'Update Password?',
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
                  Obx(() => CustomTextFormField(
                        controller: controller.passwordTextEditingController,
                        isPasswordTextField:
                            controller.toggleHidePassword.value,
                        hintText: 'Password',
                        suffixIcon: CustomTightTextButtonWidget(
                          onTap: () {
                            //Get.toNamed(AppRoutes.forgotPassword);
                          },
                          child: Text('Show',
                              style: AppTextStyles.bodySmallTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.primaryColor,
                              )),
                        ),
                      )),
                  AppGaps.hGap20,
                  /*<-------Text field for confirm password ------>*/
                  Obx(() => CustomTextFormField(
                        controller:
                            controller.confirmPasswordTextEditingController,
                        isPasswordTextField:
                            controller.toggleHideConfirmPassword.value,
                        hintText: 'Re-enter your password',
                        suffixIcon: CustomTightTextButtonWidget(
                          onTap: () {
                            //Get.toNamed(AppRoutes.forgotPassword);
                          },
                          child: Text('Show',
                              style: AppTextStyles.bodySmallTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.primaryColor,
                              )),
                        ),
                      )),
                  AppGaps.hGap30,
                  CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Update',
                      style: AppTextStyles.semiSmallXBoldTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
