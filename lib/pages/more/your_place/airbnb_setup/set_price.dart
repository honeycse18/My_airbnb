import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SetPriceController extends GetxController {
  var isEditing = false.obs;
  var price = "20".obs;
  var isExpanded = false.obs;
  late TextEditingController priceController;

  @override
  void onInit() {
    super.onInit();
    priceController = TextEditingController(text: price.value);
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }

  void toggleEditing() {
    if (isEditing.value) {
      price.value = priceController.text;
    }
    isEditing.value = !isEditing.value;
  }

  void toggleDetails() {
    isExpanded.value = !isExpanded.value;
  }
}

class SetPriceView extends StatelessWidget {
  const SetPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetPriceController>(
      init: SetPriceController(),
      builder: (SetPriceController controller) {
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
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGaps.hGap24,
                Text(
                  'Now, set your price',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap12,
                const TitleSubtitleWidget(subtitle: 'You can change it anytime'),
                AppGaps.hGap160,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      if (controller.isEditing.value) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: controller.toggleEditing,
                            child: EditableText(
                              controller: controller.priceController,
                              focusNode: FocusNode(),
                              style: AppTextStyles.priceBoldTextStyle
                                  .copyWith(color: AppColors.primaryColor),
                              cursorColor: Colors.black,
                              backgroundCursorColor: Colors.black,
                              onSubmitted: (newValue) {
                                controller.price.value = newValue;
                                controller.toggleEditing();
                              },
                            ),
                          ),
                        );
                      } else {
                        return Text(
                          '\$${controller.price.value}',
                          style: AppTextStyles.priceBoldTextStyle,
                        );
                      }
                    }),
                    IconButton(
                      icon: Obx(() => Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.containerBackColor),
                            child: SvgPicture.asset(
                              controller.isEditing.value
                                  ? AppAssetImages.rightArrowSVGLogoLine
                                  : AppAssetImages.editIconSVGLogoLine,
                              color: AppColors.primaryColor,
                              width: 20.0,
                              height: 20.0,
                            ),
                          )),
                      onPressed: controller.toggleEditing,
                    ),
                  ],
                ),
                AppGaps.hGap4,
                InkWell(
                  onTap: controller.toggleDetails,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                          'Guest price before taxes \$${controller.price.value}')),
                      Obx(() => Icon(controller.isExpanded.value
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down)),
                    ],
                  ),
                ),
                Obx(() => controller.isExpanded.value
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppGaps.hGap30,
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.dottedColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Base price',
                                      style: AppTextStyles.bodyLargeTextStyle,
                                    ),
                                    Text(
                                      '\$20',
                                      style: AppTextStyles.bodyLargeTextStyle,
                                    )
                                  ],
                                ),
                                AppGaps.hGap16,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Guest service fee',
                                      style: AppTextStyles.bodyLargeTextStyle,
                                    ),
                                    Text(
                                      '\$3',
                                      style: AppTextStyles.bodyLargeTextStyle,
                                    )
                                  ],
                                ),
                                AppGaps.hGap20,
                                Divider(
                                  color: AppColors.dottedColor,
                                  thickness: 1,
                                ),
                                AppGaps.hGap20,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Guest price before taxes',
                                        style: AppTextStyles
                                            .bodyLargeSemiboldTextStyle),
                                    Text(
                                      '\$23',
                                      style: AppTextStyles
                                          .bodyLargeSemiboldTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          AppGaps.hGap16,
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.dottedColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Your earn',
                                    style: AppTextStyles
                                        .bodyLargeSemiboldTextStyle),
                                Text(
                                  '\$19',
                                  style:
                                      AppTextStyles.bodyLargeSemiboldTextStyle,
                                ),
                              ],
                            ),
                          ),
                          AppGaps.hGap10,
                          InkWell(
                            onTap: controller.toggleDetails,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Show less',
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink()),
              ],
            ))),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.addDiscounts);
                },
                child: const Text(
                  'Next',
                  style: AppTextStyles.semiMediumBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
