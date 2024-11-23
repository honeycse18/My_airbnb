import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/screen_parameter.dart/sign_up.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  var selectedStartDate = DateTime.now().obs;
  var selectedStartTime = TimeOfDay.now().obs;
  var selectedEndDate = DateTime.now().obs;
  var selectedEndTime = TimeOfDay.now().obs;
  bool isEmail = true;
  RxBool toggleHidePassword = true.obs;
  RxBool toggleAgreeTermsConditions = false.obs;

  SignUpScreenParameter? screenParameter;
  void updateSelectedStartDate(DateTime newDate) {
    selectedStartDate.value = newDate;
  }

  String? passwordFormValidator(String? text) {
    if (Helper.passwordFormValidator(text) == null) {
      return null;
    }
    return Helper.passwordFormValidator(text);
  }

  void onPasswordSuffixEyeButtonTap() {
    toggleHidePassword.value = !toggleHidePassword.value;
  }

  void onToggleAgreeTermsConditions(bool? value) {
    toggleAgreeTermsConditions.value = value ?? false;
    update();
  }

  void onContinueButtonTap() {
    Get.toNamed(AppRoutes.verification);
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GetBuilder(
      init: RegisterController(),
      builder: (RegisterController controller) {
        return Scaffold(
          appBar: CoreWidgets.appBarWidget(
            screenContext: context,
            hasBackButton: true,
          ),
          body: CustomScaffoldBodyWidget(
            child: SafeArea(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.signUpFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <-------- SignUp Form --------> */
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppGaps.hGap10,
                              Text(
                                'Enter your information for create account',
                                style:
                                    AppTextStyles.titleLargeMdiumBoldTextStyle,
                              ),
                              AppGaps.hGap22,
                              /*<-------Text field for full name ------>*/
                              CustomTextFormField(
                                validator: Helper.textFormValidator,
                                controller:
                                    controller.nameTextEditingController,
                                labelText: 'Full Name',
                                hintText: 'E.g jhon doe',
                              ),
                              AppGaps.hGap25,
                              /*<-------Text field for email ------>*/
                              CustomTextFormField(
                                validator: Helper.emailFormValidator,
                                controller:
                                    controller.emailTextEditingController,
                                labelText: 'Email',
                                hintText: 'E.g abc@example.com',
                                isReadOnly: true,
                              ),
                              AppGaps.hGap25,
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
                                      firstDate:
                                          DateTime(DateTime.now().year - 100),
                                      lastDate: DateTime.now());
                                  if (pickedDate != null) {
                                    controller
                                        .updateSelectedStartDate(pickedDate);
                                  }

                                  controller.update();
                                },
                              ),
                              AppGaps.hGap25,
                              /*<-------Text field for password ------>*/
                              Obx(() => CustomTextFormField(
                                    validator: controller.passwordFormValidator,
                                    controller: controller
                                        .passwordTextEditingController,
                                    isPasswordTextField:
                                        controller.toggleHidePassword.value,
                                    labelText: 'Password',
                                    hintText: '********',
                                    suffixIcon: IconButton(
                                        padding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        color: Colors.transparent,
                                        onPressed: controller
                                            .onPasswordSuffixEyeButtonTap,
                                        icon: SvgPictureAssetWidget(
                                            controller.toggleHidePassword.value
                                                ? AppAssetImages.hideSVGLogoLine
                                                : AppAssetImages
                                                    .showSVGLogoLine,
                                            color: controller
                                                    .toggleHidePassword.value
                                                ? AppColors.primaryTextColor
                                                : AppColors.primaryColor)),
                                  )),
                              AppGaps.hGap15,
                              /*<------- checkbox for terms and conditions ------>*/
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Obx(() => Checkbox(
                                        activeColor: AppColors.primaryColor,
                                        value: controller
                                            .toggleAgreeTermsConditions.value,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                        checkColor: AppColors.whiteColor,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        onChanged: controller
                                            .toggleAgreeTermsConditions)),
                                  ),
                                  AppGaps.wGap10,
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => controller
                                          .onToggleAgreeTermsConditions(
                                              !controller
                                                  .toggleAgreeTermsConditions
                                                  .value),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runSpacing: -15.0,
                                        children: [
                                          Text(
                                            'By signing up. you agree to the ',
                                            style: AppTextStyles
                                                .bodySmallTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .primaryTextColor),
                                          ),
                                          CustomTightTextButtonWidget(
                                              onTap: () {},
                                              child: Text(
                                                'Terms of service ',
                                                style: AppTextStyles
                                                    .bodySmallMediumTextStyle
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: AppColors
                                                            .primaryColor),
                                              )),
                                          Text(
                                            'and ',
                                            style: AppTextStyles
                                                .bodySmallTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .primaryTextColor),
                                          ),
                                          CustomTightTextButtonWidget(
                                              onTap: () {},
                                              child: Text(
                                                'Privacy policy',
                                                style: AppTextStyles
                                                    .bodySmallMediumTextStyle
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: AppColors
                                                            .primaryColor),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /* <---- for extra 32px gap in height ----> */
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomStretchedTextButtonWidget(
              buttonText: 'Create Account',
              onTap: controller.onContinueButtonTap,
            ),
          ),
        );
      },
    );
  }
}
