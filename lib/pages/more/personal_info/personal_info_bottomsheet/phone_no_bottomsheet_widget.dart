import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../constants/app_gaps.dart';

class PhoneNoBottomsheetWidgetController extends GetxController {
  TextEditingController phoneTextEditingController = TextEditingController();
  CountryCode currentCountryCode = CountryCode.fromCountryCode('BD');

  void onCountryChange(CountryCode countryCode) {
    currentCountryCode = countryCode;
    update();
  }

  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class PhoneNoBottomsheetWidget extends StatelessWidget {
  const PhoneNoBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PhoneNoBottomsheetWidgetController(),
      builder: (PhoneNoBottomsheetWidgetController controller) {
        return SizedBox(
          height: context.height * 0.6,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      )),
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'add phone number',
                    ),
                  ),
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppGaps.hGap10,
                              Text(
                                'add a number so confirmed guests and Airbnb can get in touch. you can add other number choose how they’re used.',
                                style: AppTextStyles.labelTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor),
                              ),
                              AppGaps.hGap20,
                              CustomPhoneNumberTextFormFieldWidget(
                                validator: Helper.phoneFormValidator,
                                initialCountryCode:
                                    controller.currentCountryCode,
                                controller:
                                    controller.phoneTextEditingController,
                                hintText: 'Enter Phone Number',
                                onCountryCodeChanged:
                                    controller.onCountryChange,
                              ),
                              AppGaps.hGap10,
                              Text(
                                  'you calendar may be blocked for up to an hour \nwe verify your new legal name.',
                                  style: AppTextStyles.SmallTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor)),
                            ],
                          )),
                    ),
                  ],
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Save',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
