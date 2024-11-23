import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/easy_get_started_item_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyToGetStartedController extends GetxController {}

class EasyToGetStartedView extends StatelessWidget {
  const EasyToGetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EasyToGetStartedController(),
      builder: (EasyToGetStartedController controller) {
        return Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              leadingWidth: 70,
              leading: AppbarButtonWidget(onTap: () {}, title: 'Exit'),
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
                child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: CustomScaffoldBodyWidget(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap24,
                  Text(
                    'It’s easy to get started on Airbnb',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap40,
                  EasyGetStartedItemWidget(
                    title: '1 Tell us about your place',
                    subtitle:
                        'Share some basic info, like where it is and how many guests can stay.',
                    img: AppAssetImages.bedRoomImage,
                  ),
                  AppGaps.hGap40,
                  Container(height: 1, color: AppColors.dottedColor),
                  AppGaps.hGap40,
                  EasyGetStartedItemWidget(
                    title: '2 Make it stand out',
                    subtitle:
                        'Add 5 or more photos plus a title and description—we’ll help you out.',
                    img: AppAssetImages.studyTableImage,
                  ),
                  AppGaps.hGap40,
                  Container(height: 1, color: AppColors.dottedColor),
                  AppGaps.hGap40,
                  EasyGetStartedItemWidget(
                    title: '3 Finish up and publish',
                    subtitle:
                        'Choose a starting price, verify a few details, then publish your listing.',
                    img: AppAssetImages.bathRoomImage,
                  ),
                ],
              )),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.tellUsYourPlace);
                },
                child: Text(
                  'Get Started',
                  style: AppTextStyles.semiMediumBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
