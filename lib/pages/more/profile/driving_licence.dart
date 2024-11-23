import 'dart:typed_data';

import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/utils/helpers.dart';
import 'package:airbnb_app/widgets/dialogs.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrivingLicenceController extends GetxController {
  List<String> drivingLicenseImageURLs = [];
  List<dynamic> selectedDrivingLicenseImageURLs = [];
  void onUploadDrivingLicenseImageTap() {
    Helper.pickImages(
        onSuccessUploadSingleImage: _onSuccessOnUploadAddDrivingLicenseImageTap,
        imageName: 'Vehicle Image');
  }

  void _onSuccessOnUploadAddDrivingLicenseImageTap(
      List<Uint8List> rawImagesData, Map<String, dynamic> additionalData) {
    selectedDrivingLicenseImageURLs
        .addAll(rawImagesData.map((e) => e as dynamic).toList());
    update();
    Get.snackbar(
        'Successfully Uploaded', 'Successfully Uploaded New Thumbnail Imag ');
  }
}

class DrivingLicence extends StatelessWidget {
  const DrivingLicence({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DrivingLicenceController(),
      builder: (DrivingLicenceController controller) {
        return Scaffold(
          appBar: CoreWidgets.appBarWidget(
              screenContext: context,
              titleWidget: Text(
                'Get Verified',
              ),
              hasBackButton: true),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    'Driving License',
                    style: AppTextStyles.titlesemiSmallXBoldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AppGaps.hGap10,
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'We’ll need you to add an official government ID. This step helps make sure you’re really you.',
                    style: AppTextStyles.bodyLargeTextStyle
                        .copyWith(color: AppColors.secondaryTextColor),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AppGaps.hGap30,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      MultiImageUploadSectionWidget(
                        title: 'Font Side',
                        isRequired: true,
                        imageURLs: controller.drivingLicenseImageURLs,
                        onImageUploadTap:
                            controller.onUploadDrivingLicenseImageTap,
                      ),
                      AppGaps.hGap25,
                      MultiImageUploadSectionWidget(
                        title: 'Back Side',
                        isRequired: true,
                        imageURLs: controller.drivingLicenseImageURLs,
                        onImageUploadTap:
                            controller.onUploadDrivingLicenseImageTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
            child: CustomStretchedButtonWidget(
              onTap: () {
                AppDialogs.showSuccessDialog(
                    img: Image.asset(
                      AppAssetImages.timerIconImage,
                    ),
                    titleText: 'We are reviewing your ID',
                    messageText:
                        'Thanks for completing this important step. We’ll let you know soon if we need any more info from you.');
              },
              child: Text(
                'Submit',
                style: AppTextStyles.semiMediumBoldTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
