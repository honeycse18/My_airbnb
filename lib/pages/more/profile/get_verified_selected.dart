import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/list_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetVerifiedSelectedController extends GetxController {}

class GetVerifiedSelectedView extends StatelessWidget {
  const GetVerifiedSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GetVerifiedSelectedController(),
      builder: (GetVerifiedSelectedController controller) {
        return Scaffold(
            appBar: CoreWidgets.appBarWidget(
                screenContext: context,
                hasBackButton: true,
                titleWidget: Text('Which best describes this account?')),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This information helps you get the right hosting features and helps Appstick comply with local laws and regulations.',
                    style: AppTextStyles.bodyLargeTextStyle
                        .copyWith(color: AppColors.secondaryTextColor),
                  ),
                  AppGaps.hGap20,
                  Text(
                    'Why it’s important',
                    style: AppTextStyles.bodyLargeXBoldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTextWidget(),
                  ),
                ],
              ),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.login);
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
