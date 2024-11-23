import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/models/fakeModel/fake_data.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/best_place_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/describe_account_list_item_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_widgets/best_describe_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestDescribeController extends GetxController {
  bool isSelected = false;
  bool isActiveSelected = true;
  int selectedPlaceMethodIndex = 0;
  String id = '';
  BestPlaceOptionModel selectedPlaceOption = FakeData.BestPlaceTypeList[0];
  bool value = false;
  bool theme = false;
  void toggleIsSelected() {
    isSelected = !isSelected;
    update();
  }
}

class BestDescribeView extends StatelessWidget {
  const BestDescribeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BestDescribeController(),
      builder: (BestDescribeController controller) {
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
                SliverToBoxAdapter(child: AppGaps.hGap10),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Which of these best describes your place?',
                          maxLines: 2,
                          style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: AppGaps.hGap34),
                SliverGrid.builder(
                    itemCount: FakeData.BestPlaceTypeList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: AppGaps.screenPaddingValue,
                            mainAxisSpacing: AppGaps.screenPaddingValue,
                            mainAxisExtent: 105,
                            crossAxisCount: 2,
                            childAspectRatio: 1),
                    itemBuilder: (BuildContext context, int index) {
                      final selectedOption = FakeData.BestPlaceTypeList[index];

                      return DescribeListItemWidget(
                        img: selectedOption.localSVGImageLocation,
                        PlaceOption: selectedOption.viewAbleName,
                        cancelReason: selectedOption,
                        selectedCancelReason: controller.selectedPlaceOption,
                        hasShadow: controller.selectedPlaceMethodIndex == index,
                        onTap: () {
                          controller.selectedPlaceMethodIndex = index;
                          controller.selectedPlaceOption = selectedOption;

                          controller.update();
                        },
                        index: index,
                        selectedPlaceMethodIndex:
                            controller.selectedPlaceMethodIndex,
                      );
                    }),
                SliverToBoxAdapter(child: AppGaps.hGap65),
              ],
            ))),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.guestPlaceType);
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
