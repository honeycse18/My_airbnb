import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/edit_profile_bottomsheet/add_account_manager_bottomsheet.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AccountSectionController extends GetxController {
  int currentStep = 0;
  continueStep() {
    if (currentStep < 2) {
      currentStep = currentStep + 1;
    }
    update();
  }

  Widget controlsBuilder(context, details) {
    return Row(
      children: [
        RawButtonWidget(
            onTap: () {
              details.onStepContinue;
              Get.bottomSheet(AddAccountManagerBottomsheet());
            },
            child: Text(
              'Edit',
              style: AppTextStyles.bodyLargeSemiboldTextStyle
                  .copyWith(color: AppColors.primaryColor),
            )),
      ],
    );
  }

  onStepTapped(int value) {
    currentStep = value;
    update();
  }

  cancelStep() {
    if (currentStep > 0) {
      currentStep = currentStep - 1;
    }
    update();
  }
}

class AccountSection extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onEdit;

  AccountSection({
    required this.title,
    required this.content,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AccountSectionController(),
        builder: (AccountSectionController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stepper(
                  type: StepperType.vertical,
                  currentStep: controller.currentStep,
                  onStepContinue: controller.continueStep,
                  onStepTapped: controller.onStepTapped,
                  onStepCancel: controller.cancelStep,
                  controlsBuilder: controller.controlsBuilder,
                  steps: [
                    Step(
                        title: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            content,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        isActive: controller.currentStep >= 0,
                        state: controller.currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled),
                    Step(
                        title: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            content,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        isActive: controller.currentStep >= 1,
                        state: controller.currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled),
                    Step(
                        title: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            content,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        isActive: controller.currentStep >= 2,
                        state: controller.currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled),
                  ]),
            ],
          );
        });
  }
}
