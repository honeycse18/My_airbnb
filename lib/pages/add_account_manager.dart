import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAccountManagerController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController aptTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController stateTextEditingController = TextEditingController();
  TextEditingController zipTextEditingController = TextEditingController();

  final List<String> countries = [
    'United States',
    'Bangladesh',
    'Canada',
    'United Kingdom',
    'India',
    'Australia'
  ];
  final List<String> cities = [
    'Khulna',
    'Dhaka',
    'Jessore',
    'London',
    'New York',
    'Minnesota'
  ];

  RxString selectedCountry = ''.obs;
  RxString selectedCity = ''.obs;

  void setSelectedCountry(String country) {
    selectedCountry.value = country;
    update();
  }

  void setSelectedCity(String city) {
    selectedCity.value = city;
    update();
  }

  var selectedStartDate = DateTime.now().obs;
  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndDate = DateTime.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;
  void updateSelectedStartDate(DateTime newDate) {
    selectedStartDate.value = newDate;
  }

  RxBool toggleAgreeTermsConditions = false.obs;

  void onToggleAgreeTermsConditions(bool? value) {
    toggleAgreeTermsConditions.value = value ?? false;
    update();
  }
}

class AddAccountManagerView extends StatelessWidget {
  const AddAccountManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddAccountManagerController(),
      builder: (AddAccountManagerController controller) {
        return Scaffold(
            appBar: CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: true,
              titleWidget: Text('Add an account manager'),
            ),
            body: SafeArea(
                child: CustomScaffoldBodyWidget(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap20,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'In this step, add details for you and only you. So even if you’re setting this up on behalf of a business, it’s still your info that’s required.',
                            style: AppTextStyles.labelTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap30,
                    CustomTextFormField(
                      validator: Helper.emailFormValidator,
                      controller: controller.nameTextEditingController,
                      labelText: 'Full Legal Name',
                      hintText: 'Full name',
                    ),
                    AppGaps.hGap25,
                    Text(
                      'Home address',
                      style: AppTextStyles.bodyLargeSemiboldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap10,
                    Text(
                      'Enter the address for their primary residence (it’s usually on utility bills).',
                      style: AppTextStyles.bodyLargeTextStyle.copyWith(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    AppGaps.hGap30,
                    Text(
                      'Select country/region',
                      style: AppTextStyles.bodyLargeSemiboldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap10,
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: Container(
                          height: 54, // Set the height of the dropdown
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  16), // Add padding inside the dropdown
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors
                                    .inputFieldBorderColor), // Set the border color to grey
                            borderRadius: BorderRadius.circular(
                                4.0), // Optional: Rounded corners for the border
                          ),
                          child: DropdownButton<String>(
                            hint: Text('Select'),
                            value: controller.selectedCountry.value.isNotEmpty
                                ? controller.selectedCountry.value
                                : null,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.setSelectedCountry(newValue);
                              }
                            },
                            isExpanded:
                                true, // Ensures the dropdown takes the full width of the container
                            items: controller.countries
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    AppGaps.hGap20,
                    CustomTextFormField(
                      controller: controller.addressTextEditingController,
                      labelText: 'Address',
                      hintText: 'House name/number + steet/road',
                    ),
                    AppGaps.hGap20,
                    CustomTextFormField(
                      controller: controller.addressTextEditingController,
                      labelText: 'Apt, Suite. (optional)',
                      hintText: 'House name/number + steet/road',
                    ),
                    AppGaps.hGap20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.addressTextEditingController,
                            labelText: 'City',
                            hintText: 'Enter your city',
                          ),
                        ),
                        AppGaps.wGap15,
                        Expanded(
                          child: CustomTextFormField(
                            controller: controller.addressTextEditingController,
                            labelText: 'State',
                            hintText: 'Enter your State',
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap20,
                    CustomTextFormField(
                      controller: controller.addressTextEditingController,
                      labelText: 'Zip Code',
                      hintText: 'House name/number + steet/road',
                    ),
                    AppGaps.hGap30,
                    CustomTextFormField(
                      labelText: 'Date of Birth',
                      hintText: '12-7-2024',
                      isReadOnly: true,
                      suffixIcon: SvgPictureAssetWidget(
                        AppAssetImages.calendar,
                        color: AppColors.primaryTextColor,
                      ),
                      controller: TextEditingController(
                        text: DateFormat('dd-MM-yyyy').format(controller
                            .selectedStartDate
                            .value) /*      ${controller.selectedStartTime.value.hourOfPeriod} : ${controller.selectedStartTime.value.minute} ${controller.selectedStartTime.value.period.name} */,
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 100),
                            lastDate: DateTime.now());
                        if (pickedDate != null) {
                          controller.updateSelectedStartDate(pickedDate);
                        }

                        /* final TimeOfDay? pickedTime = await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay.now(),
                                                          );
                                                          if (pickedTime != null) {
                                                            controller.updateSelectedStartTime(pickedTime);
                                                          } */

                        controller.update();
                      },
                    ),
                    AppGaps.hGap5,
                    Text(
                      'This may be used for verification, so make sure it matches the date of birth on your government ID.',
                      style: AppTextStyles.bodySmallTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap20,
                    Text(
                      'Place of birth',
                      style: AppTextStyles.bodyLargeSemiboldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap10,
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: Container(
                          height: 54, // Set the height of the dropdown
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  16), // Add padding inside the dropdown
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors
                                    .inputFieldBorderColor), // Set the border color to grey
                            borderRadius: BorderRadius.circular(
                                4.0), // Optional: Rounded corners for the border
                          ),
                          child: DropdownButton<String>(
                            hint: Text('Enter your city'),
                            value: controller.selectedCity.value.isNotEmpty
                                ? controller.selectedCity.value
                                : null,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.setSelectedCity(newValue);
                              }
                            },
                            isExpanded:
                                true, // Ensures the dropdown takes the full width of the container
                            items: controller.cities
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    AppGaps.hGap20,
                    Text(
                      'Citizenship',
                      style: AppTextStyles.bodyLargeSemiboldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap10,
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: Container(
                          height: 54, // Set the height of the dropdown
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  16), // Add padding inside the dropdown
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors
                                    .inputFieldBorderColor), // Set the border color to grey
                            borderRadius: BorderRadius.circular(
                                4.0), // Optional: Rounded corners for the border
                          ),
                          child: DropdownButton<String>(
                            hint: Text('Enter your city'),
                            value: controller.selectedCountry.value.isNotEmpty
                                ? controller.selectedCountry.value
                                : null,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.setSelectedCountry(newValue);
                              }
                            },
                            isExpanded:
                                true, // Ensures the dropdown takes the full width of the container
                            items: controller.countries
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    AppGaps.hGap10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Obx(() => Checkbox(
                              activeColor: AppColors.primaryColor,
                              value:
                                  controller.toggleAgreeTermsConditions.value,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              checkColor: AppColors.whiteColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              onChanged:
                                  controller.toggleAgreeTermsConditions)),
                        ),
                        AppGaps.wGap10,
                        Expanded(
                          child: Text(
                            'I am authorized to manage this account on behalf of the business.',
                            style: AppTextStyles.bodySmallTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap20,
                  ],
                ),
              ),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.addRequiredAccountInfo);
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
