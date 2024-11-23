import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/edit_profile_bottomsheet.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/widgets/settings_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void onButtonTap() {
    Get.toNamed(AppRoutes.getVerified);
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawButtonWidget(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPictureAssetWidget(
                            AppAssetImages.arrowLeftSVGLogoLine),
                      ),
                      RawButtonWidget(
                        onTap: () {
                          Get.bottomSheet(
                              isScrollControlled: true,
                              EditProfileBottomSheet());
                        },
                        child: Center(
                            child: Text(
                          'Edit',
                          style: AppTextStyles.semiSmallXBoldTextStyle.copyWith(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                      )
                    ],
                  ),
                  AppGaps.hGap16,
                  SettingCardWidget(
                    child: Column(
                      children: [
                        Container(
                          height: 173,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 28.0, right: 34.0, left: 28.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/user_img1.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      AppGaps.wGap15,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AppGaps.hGap12,
                                          Text(
                                            'Ronald M. Davis ',
                                            style: AppTextStyles
                                                .semiSmallXBoldTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .primaryTextColor),
                                          ),
                                          AppGaps.hGap5,
                                          Text(
                                            'Guest',
                                            style: AppTextStyles
                                                .bodySmallTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .primaryTextColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1 ',
                                        style: AppTextStyles.labelTextStyle
                                            .copyWith(
                                                color: AppColors.primaryColor),
                                      ),
                                      AppGaps.hGap4,
                                      Text(
                                        'Month on Airbnb',
                                        style: AppTextStyles.bodySmallTextStyle
                                            .copyWith(
                                                color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppGaps.hGap24,
                  Text(
                    'Ronald confirmed',
                    style: AppTextStyles.titlesemiSmallMediumTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap16,
                  Row(
                    children: [
                      SvgPicture.asset(AppAssetImages.tikLogo),
                      AppGaps.wGap10,
                      Text(
                        'Email Address',
                        style: AppTextStyles.bodyLargeTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ],
                  ),
                  AppGaps.hGap10,
                  Row(
                    children: [
                      SvgPicture.asset(AppAssetImages.tikLogo),
                      AppGaps.wGap10,
                      Text(
                        'Phone Number',
                        style: AppTextStyles.bodyLargeTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ],
                  ),
                  AppGaps.hGap28,
                  Divider(
                    color: AppColors.dottedColor,
                    height: 1,
                  ),
                  AppGaps.hGap28,
                  Text(
                    'Identity verification',
                    style: AppTextStyles.titlesemiSmallMediumTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TitleSubtitleWidget(
                          subtitle:
                              'Show other you\’re really you with the identity verification badge',
                        ),
                      ),
                    ],
                  ),
                  AppGaps.hGap14,
                  Container(
                    width: 143,
                    child: Center(
                      child: CustomStretchedOutlinedTextButtonWidget(
                          minSize: Size(40, 44),
                          borderColor: AppColors.dottedColor,
                          textColor: AppColors.primaryColor,
                          onTap: controller.onButtonTap,
                          appStyle: AppTextStyles.bodyTextStyle,
                          buttonText: 'Get the badge'),
                    ),
                  ),
                  AppGaps.hGap29,
                  Divider(
                    color: AppColors.dottedColor,
                    height: 1,
                  ),
                  AppGaps.hGap28,
                  Text(
                    'It\'s time to create your profile',
                    style: AppTextStyles.titlesemiSmallMediumTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap10,
                  Row(
                    children: [
                      Expanded(
                        child: TitleSubtitleWidget(
                          subtitle:
                              'Your Airbnb profile is an important part of every reservation. Create yours to help other Hosts and guests get to know you.',
                        ),
                      ),
                    ],
                  ),
                  AppGaps.hGap11,
                  CustomStretchedButtonWidget(
                    onTap: () {
                      Get.bottomSheet(
                          isScrollControlled: true, EditProfileBottomSheet());
                    },
                    child: Text(
                      'Create Profile',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                  AppGaps.hGap28,
                  Divider(
                    color: AppColors.dottedColor,
                    height: 1,
                  ),
                  AppGaps.hGap28,
                  Text(
                    'Ronald ‘s guidebook',
                    style: AppTextStyles.titlesemiSmallMediumTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap16,
                  Container(
                    height: 173,
                    width: 173,
                    decoration: BoxDecoration(
                        color: AppColors.dottedColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Ronald ‘s guidebook',
                          style: AppTextStyles.labelTextStyle,
                        ),
                      ),
                    ),
                  ),
                  AppGaps.hGap30,
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
