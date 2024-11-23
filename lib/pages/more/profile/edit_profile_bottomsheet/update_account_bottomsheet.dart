import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/list_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../constants/app_gaps.dart';

class UpdateAccountBottomsheetController extends GetxController {}

class UpdateAccountBottomsheet extends StatelessWidget {
  const UpdateAccountBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UpdateAccountBottomsheetController(),
      builder: (UpdateAccountBottomsheetController controller) {
        return SizedBox(
          height: context.height * 0.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
              appBar: CoreWidgets.appBarWidget(
                screenContext: context,
                hasBackButton: true,
                appBarBackgroundColor: AppColors.inputFieldBorderColor,
                titleWidget: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      'Which best describes this account?',
                      style: AppTextStyles.semiBoldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                  ),
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'This information helps you get the right hosting features and helps Appstick comply with local laws and regulations.',
                              style: AppTextStyles.bodyBoldTextStyle.copyWith(
                                  color: AppColors.secondaryTextColor),
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
                        )),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomStretchedButtonWidget(
                  onTap: () {
                    //  Get.toNamed(AppRoutes.describeAccount);
                  },
                  child: Text(
                    'Next',
                    style: AppTextStyles.semiMediumBoldTextStyle,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
