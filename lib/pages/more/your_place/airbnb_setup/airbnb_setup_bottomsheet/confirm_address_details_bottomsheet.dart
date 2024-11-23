import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';

import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/details_address_form_field_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';

import 'package:airbnb_app/widgets/core_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:get/get.dart';

class ConfirmAddressDetailsBottomSheetController extends GetxController {
  RxBool theme = false.obs;

  final _controller = ValueNotifier(false);
  final TextEditingController _controller1 = TextEditingController();
}

class ConfirmAddressDetailsBottomSheet extends StatelessWidget {
  const ConfirmAddressDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ConfirmAddressDetailsBottomSheetController(),
      builder: (ConfirmAddressDetailsBottomSheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Scaffold(
                appBar: CoreWidgets.appBarWidget(
                    hasBackButton: true,
                    screenContext: context,
                    titleWidget: Text(
                      'Confirm your address',
                      style: AppTextStyles.notificationSemiBoldDateSection
                          .copyWith(color: AppColors.primaryTextColor),
                    )),
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: CustomScaffoldBodyWidget(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppGaps.hGap40,
                      Container(
                        height: 61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: AppColors.dottedColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: controller._controller1,
                            cursorColor: AppColors.primaryColor,
                            decoration: InputDecoration(
                              labelText: 'Country',
                              labelStyle: AppTextStyles.bodyTextStyle.copyWith(
                                  color: AppColors.secondaryTextColor),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      AppGaps.hGap40,
                      DetailsAddressFormFieldWidget(labelText: 'State'),
                      AppGaps.hGap40,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Show your specific location',
                            style: AppTextStyles.titlesemiSmallMediumTextStyle
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          AdvancedSwitch(
                            controller: controller._controller,
                            enabled: true,
                            activeColor: AppColors.primaryColor,
                            height: 30.0,
                            width: 45.0,
                            onChanged: (value) {
                              controller._controller.addListener(() {
                                if (controller._controller.value) {
                                  controller.theme = true.obs;
                                } else {
                                  controller.theme = false.obs;
                                }
                              });
                            },
                          )
                        ],
                      ),
                      TitleSubtitleWidget(
                        subtitle:
                            'Make it clear to guests where your place is located. We\'ll only share your address after they\'ve made a reservation. learn more',
                      ),
                      AppGaps.hGap28,
                      Container(),
                    ],
                  )),
                )),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {
                      Get.toNamed(AppRoutes.basicsAboutYourPlace);
                    },
                    child: Text(
                      'Look Good',
                      style: AppTextStyles.semiSmallXBoldTextStyle,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
