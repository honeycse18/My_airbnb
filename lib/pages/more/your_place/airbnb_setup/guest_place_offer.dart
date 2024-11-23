import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/best_describe_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/guest_place_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestPlaceOfferController extends GetxController {
  bool isSelected = false;
  int selectedPlaceMethodIndex1 = 0;
  int selectedPlaceMethodIndex2 = 0;
  int selectedPlaceMethodIndex3 = 0;
  String id = '';
  BestPlaceOptionModel selectedGuestplaceOption1 =
      FakeData.GuestPlaceOfferList1[0];
  BestPlaceOptionModel selectedGuestplaceOption2 =
      FakeData.GuestPlaceOfferList2[0];
  BestPlaceOptionModel selectedGuestplaceOption3 =
      FakeData.GuestPlaceOfferList3[0];

  BestPlaceOptionModel selectedPlaceOption1 = FakeData.GuestPlaceOfferList1[0];
  BestPlaceOptionModel selectedPlaceOption2 = FakeData.GuestPlaceOfferList2[0];
  BestPlaceOptionModel selectedPlaceOption3 = FakeData.GuestPlaceOfferList3[0];
  bool value = false;
  bool theme = false;
  void toggleIsSelected() {
    isSelected = !isSelected;
    update();
  }
}

class GuestPlaceOffer extends StatelessWidget {
  const GuestPlaceOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GuestPlaceOfferController(),
      builder: (GuestPlaceOfferController controller) {
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
                              'Tell guest what your place has to offer',
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
                      child: Text(
                        'You can add more amenities after you publish your listing.',
                        maxLines: 2,
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverToBoxAdapter(
                      child: Text(
                        'What about these guest favorites?',
                        maxLines: 2,
                        style: AppTextStyles.semiMediumBoldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverGrid.builder(
                        itemCount: FakeData.GuestPlaceOfferList1.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisExtent: 105,
                                crossAxisCount: 2,
                                childAspectRatio: 1),
                        itemBuilder: (BuildContext context, int index) {
                          final selectedOption =
                              FakeData.GuestPlaceOfferList1[index];

                          return DescribeListItemWidget(
                            img: selectedOption.localSVGImageLocation,
                            PlaceOption: selectedOption.viewAbleName,
                            cancelReason: selectedOption,
                            selectedCancelReason:
                                controller.selectedPlaceOption1,
                            hasShadow:
                                controller.selectedPlaceMethodIndex1 == index,
                            onTap: () {
                              controller.selectedPlaceMethodIndex1 = index;
                              controller.selectedPlaceOption1 = selectedOption;

                              controller.update();
                            },
                            index: index,
                            selectedPlaceMethodIndex:
                                controller.selectedPlaceMethodIndex1,
                          );
                        }),
                    SliverToBoxAdapter(child: AppGaps.hGap40),
                    SliverToBoxAdapter(
                      child: Text(
                        'Do you have any standout amenities?',
                        maxLines: 2,
                        style: AppTextStyles.semiMediumBoldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverGrid.builder(
                        itemCount: FakeData.GuestPlaceOfferList2.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisExtent: 105,
                                crossAxisCount: 2,
                                childAspectRatio: 1),
                        itemBuilder: (BuildContext context, int index) {
                          final selectedOption =
                              FakeData.GuestPlaceOfferList2[index];

                          return DescribeListItemWidget(
                            img: selectedOption.localSVGImageLocation,
                            PlaceOption: selectedOption.viewAbleName,
                            cancelReason: selectedOption,
                            selectedCancelReason:
                                controller.selectedPlaceOption2,
                            hasShadow:
                                controller.selectedPlaceMethodIndex2 == index,
                            onTap: () {
                              controller.selectedPlaceMethodIndex2 = index;
                              controller.selectedPlaceOption2 = selectedOption;

                              controller.update();
                            },
                            index: index,
                            selectedPlaceMethodIndex:
                                controller.selectedPlaceMethodIndex2,
                          );
                        }),
                    SliverToBoxAdapter(child: AppGaps.hGap40),
                    SliverToBoxAdapter(
                      child: Text(
                        'Do you have any of these safety items?',
                        maxLines: 2,
                        style: AppTextStyles.semiMediumBoldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                    ),
                    SliverToBoxAdapter(child: AppGaps.hGap24),
                    SliverGrid.builder(
                        itemCount: FakeData.GuestPlaceOfferList3.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisSpacing: AppGaps.screenPaddingValue,
                                mainAxisExtent: 105,
                                crossAxisCount: 2,
                                childAspectRatio: 1),
                        itemBuilder: (BuildContext context, int index) {
                          final selectedOption =
                              FakeData.GuestPlaceOfferList3[index];

                          return DescribeListItemWidget(
                            img: selectedOption.localSVGImageLocation,
                            PlaceOption: selectedOption.viewAbleName,
                            cancelReason: selectedOption,
                            selectedCancelReason:
                                controller.selectedPlaceOption3,
                            hasShadow:
                                controller.selectedPlaceMethodIndex3 == index,
                            onTap: () {
                              controller.selectedPlaceMethodIndex3 = index;
                              controller.selectedPlaceOption3 = selectedOption;

                              controller.update();
                            },
                            index: index,
                            selectedPlaceMethodIndex:
                                controller.selectedPlaceMethodIndex3,
                          );
                        }),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.addHousePhoto);
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
