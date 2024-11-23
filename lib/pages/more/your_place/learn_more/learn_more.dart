import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/your_place/your_place_widgets/top_up_bottom_protection_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../your_place_widgets/your_qs_ans_widget.dart';

class LearnMoreViewController extends GetxController {
  var currentIndex = 0.obs;

  // List of image URLs or assets
  final List<String> imageUrls = [
    'assets/images/Sliding_image.png',
    'assets/images/Sliding_image.png',
    'assets/images/Sliding_image.png',
    // Add more images as needed
  ];

  // Update the current index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}

class LearnMoreView extends StatelessWidget {
  const LearnMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LearnMoreViewController(),
      builder: (LearnMoreViewController controller) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomScaffoldBodyWidget(
                      child: Column(
                    children: [
                      AppGaps.hGap27,
                      Align(
                          alignment: Alignment.topLeft,
                          child: CloseButtonWidget()),
                      AppGaps.hGap26,
                      Text(
                        'Aircover',
                        style: AppTextStyles.titleExtraXLargeBoldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      Text(
                        'For host',
                        style: AppTextStyles.semiSmallXBoldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      AppGaps.hGap40,
                      Container(
                        width: 188,
                        child: Text(
                            'Top-to-bottom protection always included, always free. only on Airbnb',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: AppTextStyles.bodyMediumTextStyle.copyWith(
                              color: AppColors.primaryColor,
                            )),
                      ),
                      AppGaps.hGap80,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Guest Identity Verification',
                        subtitle:
                            'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Reservation Screening',
                        subtitle:
                            'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: r'$3m Damage Protecting',
                        subtitle:
                            'Airbnb reimburses you for damage caused by guests to your home and belongings and includes these specialized protections.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Art & Valuables',
                        style: AppTextStyles.bodyMediumLargeTextStyle,
                        subtitle:
                            'get reimbursed for damaged art  or valuables',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Auto & Boat',
                        style: AppTextStyles.bodyMediumLargeTextStyle,
                        subtitle:
                            'Get comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Pet Damage ',
                        style: AppTextStyles.bodyMediumLargeTextStyle,
                        subtitle:
                            'Get comprehensive verification system checks details such as name, address, government.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Income Loss',
                        style: AppTextStyles.bodyMediumLargeTextStyle,
                        subtitle:
                            'If comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: 'Deep Cleaning',
                        style: AppTextStyles.bodyMediumLargeTextStyle,
                        subtitle:
                            'Get comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: r'$1M liability insurance',
                        subtitle:
                            'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      TitleSubtitleWidget(
                        title: '24-hour safety line',
                        subtitle:
                            'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                      ),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      AppGaps.hGap20,
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text:
                                'comparison is based on public information and free offerings by top competitor as of 10/22.',
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor)),
                        TextSpan(
                            text: ' Find details and exclusions here.',
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.primaryTextColor)),
                      ])),
                      AppGaps.hGap50,
                      Row(
                        children: [
                          Expanded(
                            child: Text('only Airbnb gives you aircover',
                                maxLines: 2,
                                style: AppTextStyles.notificationDateSection
                                    .copyWith(
                                        color: AppColors.primaryTextColor)),
                          ),
                        ],
                      ),
                      AppGaps.hGap24,
                      TopUpBottomProtectionWidget(),
                      TitleSubtitleWidget(
                        subtitle:
                            'comparison is based on public information and free offerings by top competitor as of 10/22.',
                      ),
                      AppGaps.hGap50,
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                                'boats and other vehicles are protected',
                                maxLines: 2,
                                style: AppTextStyles.notificationDateSection
                                    .copyWith(
                                        color: AppColors.primaryTextColor)),
                          ),
                        ],
                      ),
                      // AppGaps.hGap20,
                      // //Image slider

                      // Column(
                      //   children: [
                      //     Expanded(
                      //       child: PageView.builder(
                      //         itemCount: controller.imageUrls.length,
                      //         onPageChanged: (index) {
                      //           controller.updateIndex(index);
                      //         },
                      //         itemBuilder: (context, index) {
                      //           return Image.asset(
                      //             controller.imageUrls[index],
                      //             fit: BoxFit.cover,
                      //           );
                      //         },
                      //       ),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         IconButton(
                      //           icon: Icon(Icons.arrow_back),
                      //           onPressed: () {
                      //             if (controller.currentIndex.value > 0) {
                      //               controller.updateIndex(
                      //                   controller.currentIndex.value - 1);
                      //             }
                      //           },
                      //         ),
                      //         Obx(() => Text(
                      //             '${controller.currentIndex.value + 1} / ${controller.imageUrls.length}')),
                      //         IconButton(
                      //           icon: Icon(Icons.arrow_forward),
                      //           onPressed: () {
                      //             if (controller.currentIndex.value <
                      //                 controller.imageUrls.length - 1) {
                      //               controller.updateIndex(
                      //                   controller.currentIndex.value + 1);
                      //             }
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      AppGaps.hGap20,
                    ],
                  )),
                  AppGaps.hGap50,
                  YourQsAnsWidget(),
                  CustomScaffoldBodyWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppGaps.hGap50,
                        Text(
                          'The super easy way to airbnb your place',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titleExtraXLargeBoldTextStyle
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                        AppGaps.hGap20,
                        Text(
                          'our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
                        ),
                        AppGaps.hGap30,
                        RawButtonWidget(
                            onTap: () {
                              Get.toNamed(AppRoutes.easyToGetStarted);
                            },
                            child: Container(
                              height: 54,
                              width: 178,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Airbnb Setup',
                                  style: AppTextStyles.notificationDateSection
                                      .copyWith(color: AppColors.whiteColor),
                                ),
                              ),
                            )),
                        AppGaps.hGap60,
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
