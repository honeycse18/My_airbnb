import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/first%20reservation_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhoFirstReservationController extends GetxController {
  int selectedAccountMethodIndex = 0;

  FirstReservationOptionModel selectedAccountOption =
      FakeData.FirstReservationTypeList[0];
}

class WhoFirstReservation extends StatelessWidget {
  const WhoFirstReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WhoFirstReservationController(),
      builder: (WhoFirstReservationController controller) {
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
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Choose who to welcome for your first reservation',
                              maxLines: 2,
                              style: AppTextStyles
                                  .titleSemiSmallSemiboldTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap12),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text:
                                      'After your first guest, anyone can book your place. ',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor),
                                ),
                                TextSpan(
                                  text: 'learn more',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.primaryTextColor,
                                      decoration: TextDecoration.underline),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap20),
                    SliverList.separated(
                      itemCount: FakeData.FirstReservationTypeList.length,
                      itemBuilder: (context, index) {
                        final selectedOption =
                            FakeData.FirstReservationTypeList[index];
                        return ReservationListItemWidget(
                          cancelReason: selectedOption,
                          selectedCancelReason:
                              controller.selectedAccountOption,
                          hasShadow:
                              controller.selectedAccountMethodIndex == index,
                          onTap: () {
                            controller.selectedAccountMethodIndex = index;
                            controller.selectedAccountOption = selectedOption;

                            controller.update();
                          },
                          index: index,
                          title: selectedOption.viewAbleName,
                          subtitle: selectedOption.des,
                          selectedPlaceMethodIndex:
                              controller.selectedAccountMethodIndex,
                          radioOnChange: (Value) {
                            controller.selectedAccountMethodIndex = index;
                            controller.selectedAccountOption = selectedOption;
                            controller.update();
                          },
                          selectedAccountTypeOptionIndex:
                              controller.selectedAccountMethodIndex,
                        );
                      },
                      separatorBuilder: (context, index) => AppGaps.hGap16,
                    ),
                    SliverToBoxAdapter(
                      child: AppGaps.hGap20,
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap20),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.setPrice);
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
