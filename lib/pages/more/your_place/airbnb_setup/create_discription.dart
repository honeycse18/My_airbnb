import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDiscriptionController extends GetxController {
  TextEditingController disController = TextEditingController();

  @override
  void onClose() {
    disController.dispose();
    super.onClose();
  }
}

class CreateDiscription extends StatelessWidget {
  const CreateDiscription({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateDiscriptionController(),
      builder: (CreateDiscriptionController controller) {
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
                  children: [
                    AppGaps.hGap37,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Create you description',
                            maxLines: 2,
                            style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap12,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Share what makes your place special.',
                            maxLines: 2,
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    CustomTextFormField(
                      controller: controller.disController,
                      maxLines: 5,
                      hintText:
                          'You’ll be charmed by this adorable place to stay.',
                    ),
                    AppGaps.hGap10,
                    Row(
                      children: [
                        Text('441 ',
                            style: AppTextStyles.bodyLargeSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor)),
                        Text('characters',
                            style: AppTextStyles.bodyLargeSemiboldTextStyle
                                .copyWith(color: AppColors.secondaryTextColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.decideConfirmReservation);
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
