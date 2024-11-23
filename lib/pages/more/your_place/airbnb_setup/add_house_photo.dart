import 'dart:io';

import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/images.dart';
import 'airbnb_widgets/add_house_photo_widget.dart';

class AddHousePhotoController extends GetxController {
  var pickedImage = Rx<File?>(null);

  // Method to pick an image from the camera
  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      pickedImage.value = File(image.path);
      Get.toNamed(AppRoutes.takePhoto);
    }
  }
}

class AddHousePhoto extends StatelessWidget {
  const AddHousePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddHousePhotoController(),
      builder: (AddHousePhotoController controller) {
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
                  children: [
                    AppGaps.hGap24,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'add some photos of your house',
                            maxLines: 2,
                            style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap12,
                    Text(
                      'You\'ll need 5 photos to get started. You can add more or make changes later.',
                      maxLines: 2,
                      style: AppTextStyles.bodyTextStyle
                          .copyWith(color: AppColors.secondaryTextColor),
                    ),
                    AppGaps.hGap24,
                    AddHousePhotoWidget(
                        onTap: () {
                          Get.toNamed(AppRoutes.choosePhotos);
                        },
                        btnName: 'Add photos',
                        img: AppAssetImages.plusSVGLogoLine),
                    AppGaps.hGap16,
                    AddHousePhotoWidget(
                        onTap: () {
                          controller.pickImageFromCamera();
                          controller.update();
                        },
                        btnName: 'Take new photos',
                        img: AppAssetImages.cameraSVGLogoLine),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.choosePhotos);
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
