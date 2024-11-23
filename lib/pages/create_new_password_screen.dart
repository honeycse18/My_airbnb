import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  final GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();

  ///
  RxBool toggleHidePassword = true.obs;
  String token = '';
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  /// Toggle value of hide confirm password
  RxBool toggleHideConfirmPassword = true.obs;
  RxBool toggleAgreeTermsConditions = false.obs;

  void onPasswordSuffixEyeButtonTap() {
    toggleHidePassword.value = !toggleHidePassword.value;
  }

  void onConfirmPasswordSuffixEyeButtonTap() {
    toggleHideConfirmPassword.value = !toggleHideConfirmPassword.value;
  }

  String? passwordFormValidator(String? text) {
    if (Helper.passwordFormValidator(text) == null) {
      if (text != confirmPasswordTextEditingController.text) {
        return 'Must Match With Confirm Password';
      }
      return null;
    }
    return Helper.passwordFormValidator(text);
  }

  void onSavePasswordButtonTap() {
    AppDialogs.showSuccessDialog(
        messageText:
            'Your account is complete. Please enjor the best menu from us.',
        titleText: 'Congratulation!');

    Get.offNamed(AppRoutes.login);
  }
// /* <---- Create new password ----> */

// /*<----------- Fetch screen navigation argument----------->*/

  _getScreenParameters() {
    dynamic params = Get.arguments;
    if (params is String) {
      token = params;
    }
    update();
  }
/* <---- Initial state ----> */

  @override
  void onInit() {
    _getScreenParameters();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.onClose();
  }
}

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CreateNewPasswordController(),
        builder: (CreateNewPasswordController controller) => Scaffold(
              /* <---- AppBar ----> */
              appBar: CoreWidgets.appBarWidget(
                  screenContext: context, hasBackButton: true),
              /* <---- Body content----> */
              /* <---- Form for creating new password ----> */
              body: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.changePassFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      AppGaps.hGap24,
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* <---- for extra 32px gap in height ----> */
                            AppGaps.hGap32,
                            Text(
                              'Create New Password',
                              style: AppTextStyles.titleBoldTextStyle.copyWith(
                                  color: AppColors.primaryTextColor),
                            ),

                            /* <---- for extra 32px gap in height ----> */
                            AppGaps.hGap32,
                            /*<-------Text field for password ------>*/
                            Obx(() => CustomTextFormField(
                                  validator: controller.passwordFormValidator,
                                  controller:
                                      controller.passwordTextEditingController,
                                  isPasswordTextField:
                                      controller.toggleHidePassword.value,
                                  labelText: 'New Password',
                                  hintText: 'Enter Password',
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
                                          AppAssetImages.hideSVGLogoLine,
                                          color: controller
                                                  .toggleHidePassword.value
                                              ? AppColors.bodyTextColor
                                              : AppColors.primaryTextColor)),
                                )),
                            AppGaps.hGap24,
                            /*<-------Text field for confirm password ------>*/
                            Obx(() => CustomTextFormField(
                                  validator: controller.passwordFormValidator,
                                  controller: controller
                                      .confirmPasswordTextEditingController,
                                  isPasswordTextField: controller
                                      .toggleHideConfirmPassword.value,
                                  labelText: 'Confirm New Password',
                                  hintText: 'Enter Password',
                                  suffixIcon: IconButton(
                                      padding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity),
                                      color: Colors.transparent,
                                      onPressed: controller
                                          .onConfirmPasswordSuffixEyeButtonTap,
                                      icon: SvgPictureAssetWidget(
                                          AppAssetImages.hideSVGLogoLine,
                                          color: controller
                                                  .toggleHideConfirmPassword
                                                  .value
                                              ? AppColors.bodyTextColor
                                              : AppColors.primaryTextColor)),
                                )),
                            /* <---- for extra 32px gap in height ----> */
                            AppGaps.hGap32,
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              /*<------- Bottom Bar ------>*/
              bottomNavigationBar: CustomScaffoldBodyWidget(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomStretchedTextButtonWidget(
                      buttonText: 'Continue',
                      onTap: controller.onSavePasswordButtonTap,
                    ),
                    AppGaps.hGap24
                  ],
                ),
              ),
            ));
  }
}
