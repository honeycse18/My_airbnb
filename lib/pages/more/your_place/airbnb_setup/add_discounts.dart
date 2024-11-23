import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';

import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/add_discount_widget.dart';
import 'package:airbnb_app/routes/routes.dart';

import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDiscountsController extends GetxController {
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

class AddDiscountsView extends StatelessWidget {
  const AddDiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddDiscountsController(),
      builder: (AddDiscountsController controller) {
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
                  'Add Discounts',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap12,
                Text(
                  'Help your place stand out to get booked faster and earn your first reviews.',
                  style: AppTextStyles.bodyTextStyle
                      .copyWith(color: AppColors.secondaryTextColor),
                ),
                AppGaps.hGap24,
                Obx(
                  () => AddDiscountWidget(
                    text: '20%',
                    hasShadow: true,
                    title: 'New listing promotion',
                    subtitle: 'Offer 20% off your first 3 bookings.',
                    index: 1,
                    isChecked: controller.isChecked1.value,
                    onCheckboxChanged: controller.toggleCheckbox1,
                  ),
                ),
                AppGaps.hGap16,
                Obx(
                  () => AddDiscountWidget(
                    text: '10%',
                    hasShadow: true,
                    title: 'Weekly discount',
                    subtitle: 'For stays 7 nights or more',
                    index: 2,
                    isChecked: controller.isChecked2.value,
                    onCheckboxChanged: controller.toggleCheckbox2,
                  ),
                ),
                AppGaps.hGap16,
                Obx(
                  () => AddDiscountWidget(
                    text: '20%',
                    hasShadow: true,
                    title: 'Monthly discount',
                    subtitle: 'For stays 28 nights or more',
                    index: 3,
                    isChecked: controller.isChecked3.value,
                    onCheckboxChanged: controller.toggleCheckbox3,
                  ),
                ),
              ],
            ))),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.lastStep);
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
