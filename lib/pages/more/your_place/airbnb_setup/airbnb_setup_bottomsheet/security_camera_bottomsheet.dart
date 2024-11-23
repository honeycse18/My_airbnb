import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityCameraBottomSheetController extends GetxController {
  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class SecurityCameraBottomsheet extends StatelessWidget {
  const SecurityCameraBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SecurityCameraBottomSheetController(),
      builder: (SecurityCameraBottomSheetController controller) {
        return SizedBox(
          height: context.height * 0.7,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
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
                ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: CustomScaffoldBodyWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tell guest about your exterior security cameras',
                          style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                        AppGaps.hGap10,
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 4.0,
                            children: [
                              Baseline(
                                baseline: 14.0,
                                baselineType: TextBaseline.alphabetic,
                                child: Text(
                                  'After your first guest, anyone can book your place.',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor),
                                ),
                              ),
                              Baseline(
                                baseline: 14.0,
                                baselineType: TextBaseline.alphabetic,
                                child: CustomTightTextButtonWidget(
                                  onTap: () {
                                    // Get.toNamed(AppPageNames.termsConditionScreen);
                                  },
                                  child: Text(
                                    'learn more',
                                    style: AppTextStyles.bodyTextStyle.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        AppGaps.hGap24,
                        CustomTextFormField(
                          controller: controller.messageController,
                          maxLines: 5,
                          hintText:
                              'You’ll be charmed by this adorable place to stay.',
                        ),
                        AppGaps.hGap10,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('450 ',
                                      style: AppTextStyles.bodyBoldTextStyle
                                          .copyWith(
                                              color:
                                                  AppColors.primaryTextColor)),
                                  Text('characters available',
                                      style: AppTextStyles.bodyBoldTextStyle
                                          .copyWith(
                                              color: AppColors
                                                  .secondaryTextColor)),
                                ],
                              ),
                            ]),
                      ],
                    ),
                  ),
                )),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {
                      Get.toNamed(AppRoutes.reviewListing);
                    },
                    child: Text(
                      'Continue',
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
