import 'dart:io';

import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/add_photo_bottomsheet.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/edit_photo_bottomsheet.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChoosePhotosController extends GetxController {
  // List of selected images
  var selectedImages = <XFile>[].obs;

  // Method to pick images from gallery
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      selectedImages.addAll(images);
    }
  }
}

class ChoosePhotos extends StatelessWidget {
  const ChoosePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChoosePhotosController(),
      builder: (ChoosePhotosController controller) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'choose at least 5 photos',
                              maxLines: 2,
                              style: AppTextStyles
                                  .titleSemiSmallSemiboldTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                            AppGaps.hGap7,
                            Text(
                              'drag to record',
                              maxLines: 2,
                              style: AppTextStyles.bodyTextStyle.copyWith(
                                  color: AppColors.secondaryTextColor),
                            ),
                          ],
                        ),
                        AddButtonWidget(onTap: () {
                          Get.bottomSheet(AddPhotoBottomsheet());
                        })
                      ],
                    ),
                    AppGaps.hGap50,
                    Obx(() {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...controller.selectedImages.map((image) {
                              return Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 173,
                                    height: 173,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(File(image.path)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 14,
                                    child: RawButtonWidget(
                                      onTap: () {},
                                      child: Container(
                                        height: 27,
                                        width: 88,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text('Cover photo',
                                              style: AppTextStyles
                                                  .bodySmallTextStyle),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: AppColors
                                                  .inputFieldBorderColor)),
                                      child: RawButtonWidget(
                                        onTap: () {
                                          Get.bottomSheet(
                                              EditPhotoBottomsheet());
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.more_horiz,
                                            color: AppColors.primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            AppGaps.wGap15,
                            GestureDetector(
                              onTap: controller.pickImages,
                              child: DottedBorder(
                                color: AppColors.dottedColor,
                                borderType: BorderType.RRect,
                                strokeWidth: 1,
                                dashPattern: [4, 4],
                                radius: Radius.circular(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    height: 173,
                                    width: 173,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppAssetImages.plusSVGLogoLine,
                                          height: 32,
                                          width: 32,
                                        ),
                                        Text('Upload')
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    AppGaps.hGap50,
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.houseInfo);
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
