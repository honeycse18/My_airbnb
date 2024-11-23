import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_bottomsheet/phone_no_bottomsheet_widget.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_widgets/personal_info_widget.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_widgets/textfield_with_label.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_widgets/expansionTile.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/about_us_bottomsheet_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_bottomsheet/editprofile_address_bottomsheet.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  bool isSelected = false;

  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  void toggleExpansion1() {
    isExpanded1 = !isExpanded1;
    update();
  }

  void toggleExpansion2() {
    isExpanded2 = !isExpanded2;
    update();
  }

  void toggleExpansion3() {
    isExpanded3 = !isExpanded3;
    update();
  }
}

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PersonalInfoController(),
      builder: (PersonalInfoController controller) {
        return Scaffold(
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap18,
                  BackButtonWidget(),
                  AppGaps.hGap20,
                  Text(
                    'Personal Info',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap30,
                  CustomExpansionTileWidget(
                    expand: controller.isExpanded1,
                    title: 'Legal Name',
                    btnText: 'save and continue',
                    width: 222,
                    onTap: controller.toggleExpansion1,
                    btnOnTap: () {},
                    subtitle:
                        'You calendar may be blocked for up to an hour as we verify your new legal name.',
                    expandWidget: Column(
                      children: [
                        CustomTextFieldWithLabel(
                            hasShadow: controller.isSelected,
                            labelText: 'First name on ID'),
                        SizedBox(height: 20),
                        CustomTextFieldWithLabel(
                            hasShadow: controller.isSelected,
                            labelText: 'Last name on ID'),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  CustomExpansionTileWidget(
                    expand: controller.isExpanded2,
                    title: 'Preferred first name',
                    btnText: 'save',
                    width: 104,
                    onTap: controller.toggleExpansion2,
                    btnOnTap: () {},
                    subtitle:
                        'You calendar may be blocked for up to an hour we verify your new legal name.',
                    expandWidget: Column(
                      children: [
                        CustomTextFieldWithLabel(
                            hasShadow: controller.isSelected,
                            labelText: 'preferred first name (optional)'),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  PersonalInfoWidget(
                    onTap: () {
                      Get.bottomSheet(PhoneNoBottomsheetWidget());
                    },
                    title: 'Phone Number',
                    btnText: 'Continue',
                    subtitle:
                        'add a number so confirmed guests and Airbnb can get in touch. you can add other number choose how they’re used.',
                  ),
                  CustomExpansionTileWidget(
                    expand: controller.isExpanded3,
                    title: 'Email',
                    btnText: 'save',
                    width: 104,
                    onTap: controller.toggleExpansion3,
                    btnOnTap: () {},
                    subtitle: 'use an address you’ll always have accessto.',
                    expandWidget: Column(
                      children: [
                        CustomTextFieldWithLabel(
                            hasShadow: controller.isSelected, labelText: ''),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                  PersonalInfoWidget(
                    onTap: () {
                      Get.bottomSheet(EditProfileAddressBottomSheet(),
                          isScrollControlled: true);
                    },
                    title: 'Address',
                    btnText: 'Continue',
                    subtitle: '',
                  ),
                  PersonalInfoWidget(
                    onTap: () {
                      Get.toNamed(AppRoutes.emergencyContact);
                    },
                    title: 'Emergency contact',
                    btnText: 'Continue',
                    subtitle: '',
                  ),
                  PersonalInfoWidget(
                    onTap: () {},
                    title: 'Government ID',
                    btnText: 'Continue',
                    subtitle: '',
                  ),
                  AppGaps.hGap10,
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
