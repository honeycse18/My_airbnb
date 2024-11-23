import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../constants/app_gaps.dart';
import '../../../../constants/colors.dart';

class AddAccountManagerBottomSheetController extends GetxController {
  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class AddAccountManagerBottomsheet extends StatelessWidget {
  const AddAccountManagerBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddAccountManagerBottomSheetController(),
      builder: (AddAccountManagerBottomSheetController controller) {
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
                hasBackButton: false,
                appBarBackgroundColor: AppColors.inputFieldBorderColor,
                titleWidget: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Text(
                      'Does anyone else manage this account?',
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
                          children: [
                            Text(
                              'Let us know if anyone else logs into this Appstick account. We\'ll ask you for their information next.',
                              style: AppTextStyles.labelTextStyle
                                  .copyWith(
                                      color: AppColors.secondaryTextColor),
                            ),
                            AppGaps.hGap20,
                          ],
                        )),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomStretchedButtonWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.addAccountManager);
                  },
                  child: Text(
                    'Save',
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
