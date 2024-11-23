import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/security_camera_bottomsheet.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/last_step_item_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastStepController extends GetxController {
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;

  void toggleCheckbox1(bool value) {
    isChecked1.value = value;
  }

  void toggleCheckbox2(bool value) {
    isChecked2.value = value;
  }

  void toggleCheckbox3(bool value) {
    isChecked3.value = value;
  }
}

class LastStepView extends StatelessWidget {
  const LastStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LastStepController>(
      init: LastStepController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 135,
            leading: AppbarButtonWidget(onTap: () {}, title: 'Save & Exit'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: AppbarButtonWidget(
                  onTap: () {},
                  title: 'Questions?',
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: CustomScaffoldBodyWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap24,
                  Text(
                    'Just One Last Step!',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap12,
                  Text(
                    'Does your place have any of these?',
                    style: AppTextStyles.semiMediumBoldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap42,
                  Obx(() => LastStepItemWidget(
                        onTap: () {
                          Get.bottomSheet(
                              isScrollControlled: true,
                              SecurityCameraBottomsheet());
                        },
                        hasShadow: true,
                        text: 'Exterior Security Cameras',
                        index: 1,
                        isChecked: controller.isChecked1.value,
                        onCheckboxChanged: controller.toggleCheckbox1,
                      )),
                  Obx(() => LastStepItemWidget(
                        onTap: () {},
                        hasShadow: true,
                        text: 'Noise Decibel Monitors',
                        index: 2,
                        isChecked: controller.isChecked2.value,
                        onCheckboxChanged: controller.toggleCheckbox2,
                      )),
                  Obx(() => LastStepItemWidget(
                        onTap: () {},
                        hasShadow: true,
                        text: 'Weapons',
                        index: 3,
                        isChecked: controller.isChecked3.value,
                        onCheckboxChanged: controller.toggleCheckbox3,
                      )),
                  AppGaps.hGap40,
                  Container(
                    height: 1,
                    color: AppColors.dottedColor,
                  ),
                  AppGaps.hGap40,
                  TitleSubtitleWidget(
                    title: 'Important things to know',
                    subtitle:
                        'Security cameras that monitor indoor spaces are not allowed even if they\'re turned off. All exterior security cameras must be disclosed.',
                  ),
                  AppGaps.hGap16,
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 4.0,
                    children: [
                      Baseline(
                        baseline: 14.0,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          'Be Sure To Comply With Your',
                          style: AppTextStyles.bodyTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
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
                            'Local Laws',
                            style: AppTextStyles.bodyTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                      Baseline(
                        baseline: 14.0,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          'And Review Airbnb\'s',
                          style: AppTextStyles.bodyTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
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
                            'Anti-Discrimination Policy',
                            style: AppTextStyles.bodyTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                      Baseline(
                        baseline: 14.0,
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          'And',
                          style: AppTextStyles.bodyTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
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
                            'Guest And Host Fees',
                            style: AppTextStyles.bodyTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomStretchedButtonWidget(
              onTap: () {
                Get.toNamed(AppRoutes.reviewListing);
              },
              child: Text(
                'Next',
                style: AppTextStyles.semiMediumBoldTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
