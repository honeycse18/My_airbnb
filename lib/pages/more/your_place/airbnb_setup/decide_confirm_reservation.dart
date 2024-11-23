import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/decide_reservationListItem_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/first%20reservation_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecideConfirmReservationController extends GetxController {
  int selectedAccountMethodIndex = 0;

  GuestPlaceOptionModel selectedAccountOption =
      FakeData.DecideReservationTypeList[0];
}

class DecideConfirmReservation extends StatelessWidget {
  const DecideConfirmReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DecideConfirmReservationController(),
      builder: (DecideConfirmReservationController controller) {
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
                    SliverToBoxAdapter(child: AppGaps.hGap20),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Decide how you\’ll confirm reservation',
                              maxLines: 2,
                              style: AppTextStyles
                                  .titleSemiSmallSemiboldTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap20),
                    SliverList.separated(
                      itemCount: FakeData.DecideReservationTypeList.length,
                      itemBuilder: (context, index) {
                        final selectedOption =
                            FakeData.DecideReservationTypeList[index];
                        return DecideReservationListItemWidget(
                          title: selectedOption.viewAbleName,
                          subtitle: selectedOption.des,
                          img: selectedOption.localSVGImageLocation,
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
                          selectedPlaceMethodIndex:
                              controller.selectedAccountMethodIndex,
                        );
                      },
                      separatorBuilder: (context, index) => AppGaps.hGap16,
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
                  Get.toNamed(AppRoutes.whoFirstReservation);
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
