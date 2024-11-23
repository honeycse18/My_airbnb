import 'dart:async';

import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:pinput/pinput.dart';
import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  TextEditingController otpInputTextController = TextEditingController();
  Map<String, dynamic> theData = {};
  Map<String, dynamic> resendCodeForgotPass = {};
  bool isEmail = true;
  bool isForRegistration = true;
  bool isDurationOver() {
    return otpTimerDuration.inSeconds <= 0;
  }

  /*<----------- OTP timer duration value----------->*/
  Duration otpTimerDuration = const Duration();

  Timer otpTimer = Timer(
    const Duration(seconds: 1),
    () {},
  );

  /*<-----------Reset OTP Timer ----------->*/
  _resetTimer() {
    otpTimerDuration = const Duration(seconds: 150);
  }

  onSendCodeButtonTap() {}
  void onResendButtonTap() {}
}

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VerificationController(),
        builder: (VerificationController controller) {
          return Scaffold(
            /* <-------- Body Content  --------> */
            body: SafeArea(
              child: Center(
                child: CustomScaffoldBodyWidget(
                  child: Column(
                    children: [
                      AppGaps.hGap24,
                      Row(
                        children: [
                          BackButtonWidget(),
                          AppGaps.wGap15,
                          Text(
                            'Confirm your number to',
                            style: AppTextStyles.titleSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ],
                      ),
                      AppGaps.hGap24,
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text:
                                    'We sent a 6 digits verification code via SMS to ',
                                style: AppTextStyles.bodyLargeTextStyle
                                    .copyWith(
                                        color: AppColors.secondaryTextColor),
                              ),
                              TextSpan(
                                  text: ' +880 1644091704',
                                  style: AppTextStyles
                                      .bodyLargeSemiboldTextStyle
                                      .copyWith(color: AppColors.primaryColor)),
                            ])),
                            /* <-------- 24px height gap --------> */
                            AppGaps.hGap24,
                            /* <---- OTP input field ----> */
                            Pinput(
                              controller: controller.otpInputTextController,
                              length: 6,
                              focusedPinTheme: PinTheme(
                                width: 80,
                                height: 54,
                                textStyle: const TextStyle(
                                    color: AppColors.primaryColor),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: AppColors.primaryColor, width: 2),
                                ),
                              ),
                              errorPinTheme: PinTheme(
                                width: 80,
                                height: 54,
                                textStyle: const TextStyle(
                                  color: AppColors.errorColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: AppColors.errorColor),
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 80,
                                height: 54,
                                textStyle: AppTextStyles.bodyMediumTextStyle
                                    .copyWith(
                                        color: AppColors.primaryTextColor),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                      color: AppColors.primaryTextColor,
                                      width: 1),
                                ),
                              ),
                              followingPinTheme: PinTheme(
                                width: 80,
                                height: 54,
                                textStyle: const TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                      color: AppColors.inputFieldBorderColor),
                                ),
                              ),
                            ),
                            /* <-------- 24px height gap --------> */
                            AppGaps.hGap24,
                            controller.isDurationOver()
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Resend Code in: ',
                                        style: AppTextStyles.bodyLargeTextStyle
                                            .copyWith(
                                                color: AppColors
                                                    .secondaryTextColor),
                                      ),
                                      AppGaps.wGap10,
                                      /* <---- Resend otp code remaining text ----> */
                                      Text(
                                          '${controller.otpTimerDuration.inMinutes.toString().padLeft(2, '0')}'
                                          ':${(controller.otpTimerDuration.inSeconds % 60).toString().padLeft(2, '0')}s',
                                          style: const TextStyle(
                                              color:
                                                  AppColors.primaryTextColor))
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Text('didn’t get a code?',
                                          style: AppTextStyles
                                              .bodyLargeTextStyle
                                              .copyWith(
                                                  color: AppColors
                                                      .secondaryTextColor)),
                                      TextButton(
                                        onPressed: controller.isDurationOver()
                                            ? () {
                                                controller.onResendButtonTap();
                                              }
                                            : /* null */ controller
                                                .onResendButtonTap,
                                        child: Text(
                                          'send again',
                                          style: AppTextStyles
                                              .bodyLargeTextStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                            AppGaps.hGap30,
                            DButton(
                                onTap: () {
                                  Get.toNamed(AppRoutes.homeNavigator);
                                },
                                child: Text(
                                  'Demo button for move to another page',
                                  style: TextStyle(color: AppColors.whiteColor),
                                ))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
