import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/house_choice_chips_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescribeHouseController extends GetxController {}

class DescribeHouse extends StatelessWidget {
  const DescribeHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DescribeHouseController(),
      builder: (DescribeHouseController controller) {
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
                  children: [
                    AppGaps.hGap24,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'next, let’s describe your house',
                            maxLines: 2,
                            style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap11,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Choose up to 2 highlights. We\'ll use these to get your description started.',
                            maxLines: 2,
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap40,
                    HouseChoiceChipsWidget()
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.createDiscription);
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
