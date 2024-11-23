import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool phoneMethod = false;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  CountryCode currentCountryCode = CountryCode.fromCountryCode('BD');
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  void onCountryChange(CountryCode countryCode) {
    currentCountryCode = countryCode;
    update();
  }

  void onContinueButtonTap() {
    Get.toNamed(AppRoutes.verification);
  }

  void onMethodButtonTap() {
    phoneMethod = !phoneMethod;
    update();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (LoginController controller) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                AppGaps.hGap24,
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            'Log in or sing up to Airbnb',
                                            style: AppTextStyles
                                                .titleMediumTextStyle
                                                .copyWith(
                                              color: AppColors.primaryTextColor,
                                            ))),
                                  ),
                                ],
                              ),

                              /* <-------- 24px height gap --------> */
                              AppGaps.hGap24,
                              controller.phoneMethod
                                  /* <-------- Phone Number Input Field --------> */
                                  ? Column(
                                      children: [
                                        CustomPhoneNumberTextFormFieldWidget(
                                          validator: Helper.phoneFormValidator,
                                          initialCountryCode:
                                              controller.currentCountryCode,
                                          controller: controller
                                              .phoneTextEditingController,
                                          hintText: 'Enter Phone Number',
                                          onCountryCodeChanged:
                                              controller.onCountryChange,
                                        ),
                                        TitleSubtitleWidget(
                                          subtitle:
                                              'we\’ll can or you to confirm your number. Standard message and rates apply.',
                                        )
                                      ],
                                    )
                                  /* <-------- Email Input Field --------> */
                                  : CustomTextFormField(
                                      validator: Helper.emailFormValidator,
                                      controller:
                                          controller.emailTextEditingController,
                                      hintText: 'Enter email address',
                                    ),

                              /* <-------- 20px height gap --------> */
                              AppGaps.hGap20,
                              /* <-------- Continue Button --------> */
                              CustomStretchedButtonWidget(
                                onTap: controller.onContinueButtonTap,
                                child: Text(
                                  'Continue',
                                  style: AppTextStyles.semiSmallXBoldTextStyle,
                                ),
                              ),
                              /* <-------- 24px height gap --------> */
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryTextColor),
                                    ),
                                  ),
                                  /* <-------- 8px width gap --------> */
                                  AppGaps.wGap6,
                                  Text(
                                    'Or Continue with',
                                    style: AppTextStyles.bodyTextStyle.copyWith(
                                        color: AppColors.secondaryTextColor),
                                  ),
                                  /* <-------- 8px width gap --------> */
                                  AppGaps.wGap6,
                                  Expanded(
                                    child: Container(
                                      height: 0.5,
                                      decoration: const BoxDecoration(
                                          color: AppColors.primaryTextColor),
                                    ),
                                  ),
                                ],
                              ),
                              /* <-------- 32px height gap --------> */
                              AppGaps.hGap24,
                              controller.phoneMethod
                                  /* <-------- Login with email button --------> */

                                  ? CustomStretchedOutlinedTextButtonWidget(
                                      image: Image.asset(
                                        'assets/images/email.png',
                                        color: AppColors.primaryColor,
                                        height: 24,
                                        width: 24,
                                      ),
                                      onTap: controller.onMethodButtonTap,
                                      buttonText: 'Continue with email')
                                  /* <-------- Login with phone number button --------> */
                                  : CustomStretchedOutlinedTextButtonWidget(
                                      image: Image.asset(
                                        'assets/images/Phone.png',
                                        color: AppColors.primaryTextColor,
                                      ),
                                      onTap: controller.onMethodButtonTap,
                                      buttonText: 'Continue with phone'),
                              AppGaps.hGap12,
                              CustomStretchedOutlinedTextButtonWidget(
                                  image: Image.asset(
                                    'assets/images/google.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {},
                                  buttonText: 'Continue with google'),
                              AppGaps.hGap12,
                              CustomStretchedOutlinedTextButtonWidget(
                                  image: Image.asset(
                                    'assets/images/apple.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  onTap: () {},
                                  buttonText: 'Continue with apple')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
