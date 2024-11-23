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

class ChoiceChipsBottomSheetWidgetController extends GetxController {}

class ChoiceChipsBottomSheetWidget extends StatelessWidget {
  const ChoiceChipsBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChoiceChipsBottomSheetWidgetController(),
      builder: (ChoiceChipsBottomSheetWidgetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
              appBar: AppBar(
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
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What you’re into',
                              style: AppTextStyles.semiBoldTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                            AppGaps.hGap10,
                            Text(
                              'Pick some interests you enjoy that you want to show on your profile.',
                              style: AppTextStyles.labelTextStyle.copyWith(
                                  color: AppColors.secondaryTextColor),
                            ),
                            AppGaps.hGap30,
                            Text(
                              'Interests',
                              style: AppTextStyles.semiBoldTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                          ],
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: AppGaps.hGap10,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.0, right: 16.0),
                      child: ChoiceChipsWidget(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AppGaps.hGap10,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: RawButtonWidget(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: AppTextStyles.semiBoldTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.primaryTextColor),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AppGaps.hGap30,
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '0/20',
                          style: AppTextStyles.bodyLargeBoldTextStyle
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                        Text(
                          ' Selected',
                          style: AppTextStyles.labelTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
                        ),
                      ],
                    ),
                    RawButtonWidget(
                      onTap: () {},
                      child: Container(
                        height: 54,
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Center(
                          child: Text(
                            'Save',
                            style: AppTextStyles.semiMediumBoldTextStyle
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
