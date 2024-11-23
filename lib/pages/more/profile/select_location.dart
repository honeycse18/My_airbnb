import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/confirm_address_bottomsheet.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/common/button.dart';

class SelectLocationController extends GetxController {}

class SelectLocationView extends StatelessWidget {
  const SelectLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SelectLocationController(),
      builder: (SelectLocationController controller) {
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
                  'Where’s your place located?',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap12,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Your address is only shared with guests after they\'ve made a reservation.',
                        maxLines: 2,
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                    ),
                  ],
                ),
                AppGaps.hGap24,
                Container(),
              ],
            ))),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.bottomSheet(
                      isScrollControlled: true, ConfirmAddressBottomSheet());
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
