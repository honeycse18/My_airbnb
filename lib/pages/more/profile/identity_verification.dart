import 'dart:ffi';

import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';

import 'package:airbnb_app/pages/more/profile/driving_licence.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/select_verification_method_widget.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:csc_picker/csc_picker.dart';

import '../../../widgets/common/button.dart';

class GetVerifiedController extends GetxController {
  int selectedVerificationMethodIndex = 0;
  String id = '';
  OptionModel selectedVerificationOption = FakeData.verficationOptionList[0];

  String countryValue = ' ';
}

class GetVerifiedView extends StatelessWidget {
  const GetVerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GetVerifiedController(),
      builder: (GetVerifiedController controller) {
        return Scaffold(
          appBar: AppBar(
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
                'Identity verification',
                style: AppTextStyles.titleSemiboldTextStyle
                    .copyWith(color: AppColors.primaryTextColor),
              ),
            ),
          ),
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: AppGaps.hGap10),
                SliverToBoxAdapter(child: AppGaps.hGap30),
                SliverToBoxAdapter(
                  child: Text(
                    'Choose an ID type to add',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                ),
                SliverToBoxAdapter(child: AppGaps.hGap25),
                SliverToBoxAdapter(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: AppColors.secondaryTextColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, left: 5.0, right: 5.0),
                      child: CSCPicker(
                        dropdownDialogRadius: 4,
                        searchBarRadius: 4.0,
                        flagState: CountryFlag.ENABLE,
                        onCountryChanged: (value) {
                          controller.countryValue = value;
                          controller.update();
                        },
                        defaultCountry: CscCountry.Bangladesh,
                        showStates: false,
                        showCities: false,
                        countryDropdownLabel: controller.countryValue,
                        countrySearchPlaceholder: "-Select-",
                        selectedItemStyle:
                            AppTextStyles.labelTextStyle.copyWith(
                          color: AppColors.secondaryTextColor,
                        ),
                        dropdownItemStyle:
                            AppTextStyles.labelTextStyle.copyWith(
                          color: AppColors.primaryTextColor,
                        ),
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          // border: Border.all(
                          //     color: AppColors.inputFieldBorderColor)
                        ),
                        disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: AppGaps.hGap25),
                SliverList.separated(
                  itemCount: FakeData.verficationOptionList.length,
                  itemBuilder: (context, index) {
                    final verificationOption =
                        FakeData.verficationOptionList[index];
                    return SelectVerificationMethodWidget(
                      cancelReason: verificationOption,
                      selectedCancelReason:
                          controller.selectedVerificationOption,
                      verificationOption: verificationOption.viewAbleName,
                      onTap: () {
                        controller.selectedVerificationMethodIndex = index;
                        controller.selectedVerificationOption =
                            verificationOption;

                        controller.update();
                      },
                      radioOnChange: (Value) {
                        controller.selectedVerificationMethodIndex = index;
                        controller.selectedVerificationOption =
                            verificationOption;
                        controller.update();
                      },
                      index: index,
                      selectedVerificationOptionIndex:
                          controller.selectedVerificationMethodIndex,
                    );
                  },
                  separatorBuilder: (context, index) => AppGaps.hGap10,
                ),
                SliverToBoxAdapter(
                  child: AppGaps.hGap30,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 69,
                    decoration: BoxDecoration(
                        color: AppColors.ContainerGreyColor,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 20, top: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Your ID will be handled according to our ',
                                style: AppTextStyles.bodyTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: AppTextStyles.bodyTextStyle.copyWith(
                                    color: AppColors.primaryTextColor,
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text:
                                    ' and won\'t be shared with your Host or guests.',
                                style: AppTextStyles.bodyTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AppGaps.hGap10,
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SliverToBoxAdapter(
                  child: AppGaps.hGap10,
                ),
                SliverToBoxAdapter(
                  child: CustomStretchedButtonWidget(
                    onTap: () {
                      navigateToPage(
                          context,
                          FakeData
                              .verficationOptionList[
                                  controller.selectedVerificationMethodIndex]
                              .value);
                    },
                    child: Text(
                      'Continue',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

void navigateToPage(BuildContext context, String value) {
  if (value == 'driving_license') {
    Get.toNamed(AppRoutes.drivingLicence);
  } else if (value == 'passport') {
    Get.toNamed(AppRoutes.drivingLicence);
  } else if (value == 'id_card') {
    Get.toNamed(AppRoutes.drivingLicence);
  }
}
