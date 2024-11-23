import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/about_us_bottomsheet_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/review_listing_bottomsheet.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListingController extends GetxController {
  final List<double> _progressValues = [0.0, 0.0, 0.0];
  int _currentIndicator = 0;

  void _incrementProgress() {
    if (_currentIndicator < _progressValues.length) {
      _progressValues[_currentIndicator] += 0.2;
      if (_progressValues[_currentIndicator] >= 1.0) {
        _progressValues[_currentIndicator] = 1.0;
        if (_currentIndicator < _progressValues.length - 1) {
          _currentIndicator++;
        } else {
          Get.toNamed(AppRoutes.getStarted);
          return;
        }
      }
      update();
    }
  }

  void _decrementProgress() {
    if (_currentIndicator >= 0) {
      _progressValues[_currentIndicator] -= 0.2;
      if (_progressValues[_currentIndicator] <= 0.0) {
        _progressValues[_currentIndicator] = 0.0;
        if (_currentIndicator > 0) {
          _currentIndicator--;
        } else {
          Get.back();
          return;
        }
      }
      update();
    }
  }

  Widget _stepIndicator(int index) {
    return LinearProgressIndicator(
      //minHeight: 5,
      backgroundColor: AppColors.secondaryTextColor,
      valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
      value: _progressValues[index],
    );
  }
}

class ReviewListingScreen extends StatelessWidget {
  const ReviewListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ListingController(),
      builder: (ListingController controller) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 125,
            leading: AppbarButtonWidget(
              onTap: () {},
              title: 'Save & Exit',
            ),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap24,
                    Text(
                      'Review Your Listing',
                      style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                          .copyWith(
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    AppGaps.hGap12,
                    Text(
                      'Help your place stand out to get booked faster and earn your first reviews.',
                      style: AppTextStyles.bodyTextStyle.copyWith(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    AppGaps.hGap24,
                    Center(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                    child: Image.asset(
                                      AppAssetImages.niceHome,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                      top: 10.74,
                                      left: 14,
                                      child: Container(
                                        height: 29,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.white,
                                        ),
                                        child: RawButtonWidget(
                                          onTap: () {
                                            Get.bottomSheet(
                                                isScrollControlled: true,
                                                ReviewListingBottomSheet());
                                          },
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Text(
                                                'Show preview',
                                                style: AppTextStyles
                                                    .bodySmallMediumTextStyle
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              AppGaps.hGap12,
                              Row(
                                children: [
                                  Text(
                                    'Nice home',
                                    style:
                                        AppTextStyles.labelTextStyle.copyWith(
                                      color: AppColors.primaryTextColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'New',
                                    style: AppTextStyles.bodyRegularTextStyle
                                        .copyWith(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  AppGaps.wGap4,
                                  SvgPicture.asset(
                                      AppAssetImages.blackStarSVGLogoSolid),
                                ],
                              ),
                              AppGaps.hGap10,
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\$28',
                                      style: AppTextStyles.bodyMediumTextStyle
                                          .copyWith(
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' night',
                                      style: AppTextStyles.bodyMediumTextStyle
                                          .copyWith(
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppGaps.hGap40,
                    Text(
                      'What’s next?',
                      style: AppTextStyles.semiMediumBoldTextStyle.copyWith(
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    AppGaps.hGap24,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppAssetImages.confirmSVGLogoLine),
                        AppGaps.wGap15,
                        Expanded(
                          child: TitleSubtitleWidget(
                            title: 'confirm a few details and publish',
                            subtitle:
                                'We’ll let you know if you need to verify your identity or register with the local government.',
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap40,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppAssetImages.calendarSVGLogoLine),
                        AppGaps.wGap15,
                        Expanded(
                          child: TitleSubtitleWidget(
                            title: 'Set up your calendar',
                            subtitle:
                                'Choose which dates your listing is available. It will be visible 24 hours after you publish.',
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap40,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppAssetImages.editSVGLogoLine),
                        AppGaps.wGap15,
                        Expanded(
                          child: TitleSubtitleWidget(
                            title: 'Adjust your setting',
                            subtitle:
                                'Set house rules, select a cancellation policy, choose how guests book, and more.',
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap100,
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: SizedBox(
              height: 90,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: controller._stepIndicator(0)),
                      AppGaps.wGap4,
                      Expanded(child: controller._stepIndicator(1)),
                      AppGaps.wGap4,
                      Expanded(child: controller._stepIndicator(2)),
                    ],
                  ),
                  AppGaps.hGap16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RawButtonWidget(
                        onTap: () {
                          controller._decrementProgress();
                        },
                        child: Text(
                          'Back',
                          style:
                              AppTextStyles.bodyLargeSemiboldTextStyle.copyWith(
                            color: AppColors.primaryTextColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      RawButtonWidget(
                        onTap: () {
                          controller._incrementProgress();
                        },
                        child: Container(
                          height: 54,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: AppTextStyles.semiSmallXBoldTextStyle
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
