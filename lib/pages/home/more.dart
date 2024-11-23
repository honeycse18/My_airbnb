import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/more_widgets/your_place_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/profile_widget.dart';
import 'package:airbnb_app/widgets/settings_item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MoreController extends GetxController {}

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MoreController(),
      builder: (MoreController controller) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: CustomScaffoldBodyWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppGaps.hGap18,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Profile',
                            style: AppTextStyles.titleSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon:
                                  Image.asset(AppAssetImages.notificationLogo))
                        ],
                      ),
                      AppGaps.hGap26,
                      RawButtonWidget(
                          onTap: () {
                            Get.toNamed(AppRoutes.profile);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProfileWidget(
                                padding: 12.0,
                                img: Image.asset(
                                  'assets/images/user_img1.png',
                                ),
                                name: 'Ronald M. Davis ',
                                subtitle: Text(
                                  'Show Profile',
                                  style: AppTextStyles.bodySmallTextStyle
                                      .copyWith(
                                          color: AppColors.secondaryTextColor),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(
                                    AppAssetImages.arrowRightSVGLogoLine),
                              ),
                            ],
                          )),
                      AppGaps.hGap20,
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Expanded(child: YourPlaceWidget(
                              onTap: () {
                                Get.toNamed(AppRoutes.yourPlace);
                              },
                            ))
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.dottedColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppGaps.hGap24,
                          SettingCardWidget(
                            itemName: 'Setting',
                            child: Column(
                              children: [
                                SettingItemWidget(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.personalInfo);
                                  },
                                  title: 'Personal Information',
                                  icon: AppAssetImages.personalInfoSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.loginSecurity);
                                  },
                                  title: 'Login & security',
                                  icon: AppAssetImages.securitySVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.paymentPayout);
                                  },
                                  title: 'Payments and payouts',
                                  icon: AppAssetImages.paySVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Accessibility',
                                  icon: AppAssetImages.settingSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Taxes',
                                  icon: AppAssetImages.taxSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Translation',
                                  icon: AppAssetImages.translationSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Notification',
                                  icon: AppAssetImages.notificationSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Privacy and sharing',
                                  icon: AppAssetImages.privacySVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Travel for work',
                                  icon: AppAssetImages.travelSVGLogoLine,
                                ),
                              ],
                            ),
                          ),
                          AppGaps.hGap24,
                          SettingCardWidget(
                            itemName: 'Support',
                            child: Column(
                              children: [
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Visit the Help Centre',
                                  icon: AppAssetImages.helpSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Get help with safety issue',
                                  icon: AppAssetImages.safetySVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Report a neighborhood concern',
                                  icon: AppAssetImages.neighborSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'How Airbnb work',
                                  icon: AppAssetImages.airbnbSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Give us feedback',
                                  icon: AppAssetImages.feedbackSVGLogoLine,
                                ),
                              ],
                            ),
                          ),
                          AppGaps.hGap24,
                          SettingCardWidget(
                            itemName: 'Legal',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Terms of Service',
                                  icon: AppAssetImages.listingSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Privacy Policy',
                                  icon: AppAssetImages.listingSVGLogoLine,
                                ),
                                SettingItemWidget(
                                  onTap: () {},
                                  title: 'Open Source licences',
                                  icon: AppAssetImages.listingSVGLogoLine,
                                ),
                                AppGaps.hGap20,
                                RawButtonWidget(
                                  onTap: () {},
                                  child: Text(
                                    'Log out',
                                    style: AppTextStyles.labelTextStyle
                                        .copyWith(
                                            color: AppColors.primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppGaps.hGap20,
                          Divider(
                            color: AppColors.dottedColor,
                          ),
                          AppGaps.hGap50,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
