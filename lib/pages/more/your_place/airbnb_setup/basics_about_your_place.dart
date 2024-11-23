import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/share_place_basics_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicsAboutYourPlaceController extends GetxController {
  var categoriesCount = 0.obs;

  void updateCategoriesCount(int count) {
    categoriesCount.value = count;
  }
}

class BasicsAboutYourPlaceView extends StatelessWidget {
  const BasicsAboutYourPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BasicsAboutYourPlaceController(),
      builder: (BasicsAboutYourPlaceController controller) {
        return Scaffold(
            appBar: AppBar(
              leadingWidth: 125,
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
                AppGaps.hGap23,
                Text(
                  'Share some basics about your place',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap12,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You\'ll add more details later, like bed types.',
                        maxLines: 2,
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                    ),
                  ],
                ),
                AppGaps.hGap35,
                SharePlaceBasicsWidget(
                  title: 'Guests',
                  initialCount: controller.categoriesCount.value,
                  onCountChanged: controller.updateCategoriesCount,
                ),
                AppGaps.hGap29,
                SharePlaceBasicsWidget(
                  title: 'Bathrooms',
                  initialCount: controller.categoriesCount.value,
                  onCountChanged: controller.updateCategoriesCount,
                ),
                AppGaps.hGap29,
                SharePlaceBasicsWidget(
                  title: 'Beds',
                  initialCount: controller.categoriesCount.value,
                  onCountChanged: controller.updateCategoriesCount,
                ),
                AppGaps.hGap29,
                SharePlaceBasicsWidget(
                  title: 'Bathrooms',
                  initialCount: controller.categoriesCount.value,
                  onCountChanged: controller.updateCategoriesCount,
                ),
              ],
            ))),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.guestPlaceOffer);
                },
                child: Text(
                  'Next',
                  style: AppTextStyles.semiMediumBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
