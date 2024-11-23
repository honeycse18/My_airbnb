import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginSecurityController extends GetxController {
  bool isExpanded = false;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    update();
  }

  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
}

class LoginSecurityView extends StatelessWidget {
  const LoginSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginSecurityController(),
      builder: (LoginSecurityController controller) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: CustomScaffoldBodyWidget(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  AppGaps.hGap18,
                  BackButtonWidget(),
                  AppGaps.hGap20,
                  Divider(
                    color: AppColors.dottedColor,
                    thickness: 1.0,
                  ),
                  AppGaps.hGap30,
                  Text(
                    'Login & Security',
                    style: AppTextStyles.titlesemiSmallMediumTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap50,
                  Text(
                    'Login',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap40,
                  Row(
                    /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: AppTextStyles.bodyLargeTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                            if (!controller.isExpanded) AppGaps.hGap10,
                            if (!controller.isExpanded)
                              Text(
                                'Last updated 12 days ago',
                                style: AppTextStyles.SmallTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor),
                              )
                          ],
                        ),
                      ),
                      CustomTightTextButtonWidget(
                        onTap: controller.toggleExpansion,
                        child: Text(controller.isExpanded ? 'Cancel' : 'Update',
                            style: AppTextStyles.bodyLargeTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.customTextButtonColor,
                            )),
                      )
                    ],
                  ),
                  AppGaps.hGap20,
                  if (controller.isExpanded)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: controller.passwordTextEditingController,
                          labelText: 'Current Password',
                          isPasswordTextField: true,
                        ),
                        AppGaps.hGap10,
                        CustomTightTextButtonWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.forgotPassword);
                          },
                          child: Text('Need a new password?',
                              style: AppTextStyles.bodySmallMediumTextStyle
                                  .copyWith(
                                color: AppColors.customTextButtonColor,
                              )),
                        ),
                        AppGaps.hGap20,
                        CustomTextFormField(
                          controller:
                              controller.newPasswordTextEditingController,
                          labelText: 'New Password',
                          isPasswordTextField: true,
                        ),
                        AppGaps.hGap20,
                        CustomTextFormField(
                          controller:
                              controller.confirmPasswordTextEditingController,
                          labelText: 'Confirm New Password',
                          isPasswordTextField: true,
                        ),
                        AppGaps.hGap20,
                        Container(
                          width: 218,
                          child: CustomStretchedButtonWidget(
                            onTap: () {},
                            child: Text('Update Password',
                                style: AppTextStyles.notificationDateSection),
                          ),
                        ),
                        AppGaps.hGap20,
                        Divider(
                          color: AppColors.dottedColor,
                          thickness: 1.0,
                        ),
                      ],
                    ),
                  AppGaps.hGap20,
                  // ] else ...[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: AppColors.dottedColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                AppAssetImages.securityIconSVGLogoLine),
                            AppGaps.hGap20,
                            Text(
                              'keeping your account secure',
                              style: AppTextStyles.labelTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                            AppGaps.hGap20,
                            Text(
                              'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                              style: AppTextStyles.bodyRegularTextStyle
                                  .copyWith(
                                      color: AppColors.secondaryTextColor),
                            ),
                            AppGaps.hGap20,
                            Wrap(
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 4.0,
                                children: [
                                  Baseline(
                                    baseline: 14.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      'learn about safety tips for',
                                      style: AppTextStyles.bodyRegularTextStyle
                                          .copyWith(
                                              color:
                                                  AppColors.secondaryTextColor),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 14.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: CustomTightTextButtonWidget(
                                      onTap: () {
                                        // Get.toNamed(AppPageNames.termsConditionScreen);
                                      },
                                      child: Text(
                                        'Guests',
                                        style: AppTextStyles
                                            .bodyRegularTextStyle
                                            .copyWith(
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 14.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      'And',
                                      style: AppTextStyles.bodyRegularTextStyle
                                          .copyWith(
                                              color:
                                                  AppColors.secondaryTextColor),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 14.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: CustomTightTextButtonWidget(
                                      onTap: () {
                                        // Get.toNamed(AppPageNames.termsConditionScreen);
                                      },
                                      child: Text(
                                        'Host',
                                        style: AppTextStyles
                                            .bodyRegularTextStyle
                                            .copyWith(
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      )),
                  AppGaps.hGap40,
                  Text(
                    'Account',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap40,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deactivate your account',
                          style: AppTextStyles.bodyMediumLargeTextStyle
                              .copyWith(color: AppColors.textColor),
                        ),
                        CustomTightTextButtonWidget(
                          onTap: () {},
                          child: Text('Deactivate',
                              style: AppTextStyles.bodyMediumLargeTextStyle
                                  .copyWith(
                                color: AppColors.deactivateTextColor,
                              )),
                        )
                      ]),
                  AppGaps.hGap100,
                ])),
          )),
        );
      },
    );
  }
}
