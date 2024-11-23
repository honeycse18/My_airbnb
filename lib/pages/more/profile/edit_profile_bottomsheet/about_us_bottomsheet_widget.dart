import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../constants/app_gaps.dart';

class AboutUsBottomSheetWidgetController extends GetxController {
  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class AboutUsBottomSheetWidget extends StatelessWidget {
  const AboutUsBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AboutUsBottomSheetWidgetController(),
      builder: (AboutUsBottomSheetWidgetController controller) {
        return SizedBox(
          height: context.height * 0.6,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
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
                                'About Us',
                                style: AppTextStyles.semiSmallXBoldTextStyle
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                              AppGaps.hGap10,
                              Text(
                                'The information you share will be used across Airbnb to help other guests and Hosts get to know you.',
                                style: AppTextStyles.labelTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor),
                              ),
                              AppGaps.hGap20,
                              CustomTextFormField(
                                controller: controller.messageController,
                                maxLines: 5,
                                hintText: 'Write here',
                              ),
                              AppGaps.hGap10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('450 ',
                                          style: AppTextStyles.bodyBoldTextStyle
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryTextColor)),
                                      Text('characters available',
                                          style: AppTextStyles.bodyBoldTextStyle
                                              .copyWith(
                                                  color: AppColors
                                                      .secondaryTextColor)),
                                    ],
                                  ),
                                  Text('see all',
                                      style: AppTextStyles.bodyBoldTextStyle
                                          .copyWith(
                                              color:
                                                  AppColors.primaryTextColor)),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Save',
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
