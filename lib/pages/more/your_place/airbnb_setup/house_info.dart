import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HouseInfoController extends GetxController {
  TextEditingController infoController = TextEditingController();

  @override
  void onClose() {
    infoController.dispose();
    super.onClose();
  }
}

class HouseInfo extends StatelessWidget {
  const HouseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HouseInfoController(),
      builder: (HouseInfoController controller) {
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
                    AppGaps.hGap24,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Now, let’s give your house a little',
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
                            'Short titles work best. Have fun with it—you can always change it later.',
                            maxLines: 2,
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    CustomTextFormField(
                      controller: controller.infoController,
                      maxLines: 5,
                      hintText: '',
                    ),
                    AppGaps.hGap10,
                    Row(
                      children: [
                        Text('0/40 ',
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
                  Get.toNamed(AppRoutes.describeHouse);
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
