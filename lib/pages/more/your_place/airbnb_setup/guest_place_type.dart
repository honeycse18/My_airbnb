import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/guest_place_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestPlaceTypeController extends GetxController {
  bool isSelected = false;
  int selectedPlaceMethodIndex = 0;
  String id = '';
  GuestPlaceOptionModel selectedGuestplaceOption =
      FakeData.GuestPlaceTypeList[0];
}

class GuestPlaceType extends StatelessWidget {
  const GuestPlaceType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GuestPlaceTypeController(),
      builder: (GuestPlaceTypeController controller) {
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
                      child: Text(
                        'What type of place will guests have?',
                        maxLines: 2,
                        style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap20),
                    SliverList.separated(
                      itemCount: FakeData.GuestPlaceTypeList.length,
                      itemBuilder: (context, index) {
                        final selectedOption =
                            FakeData.GuestPlaceTypeList[index];
                        return GuestPlaceTypeWidget(
                          img: selectedOption.localSVGImageLocation,
                          title: selectedOption.viewAbleName,
                          cancelReason: selectedOption,
                          selectedCancelReason:
                              controller.selectedGuestplaceOption,
                          hasShadow:
                              controller.selectedPlaceMethodIndex == index,
                          onTap: () {
                            controller.selectedPlaceMethodIndex = index;
                            controller.selectedGuestplaceOption =
                                selectedOption;

                            controller.update();
                          },
                          index: index,
                          selectedPlaceMethodIndex:
                              controller.selectedPlaceMethodIndex,
                          subtitle: selectedOption.des,
                        );
                      },
                      separatorBuilder: (context, index) => AppGaps.hGap20,
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.selectLocation);
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
