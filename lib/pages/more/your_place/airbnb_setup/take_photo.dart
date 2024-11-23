import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/add_house_photo.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/images.dart';
import 'airbnb_setup_bottomsheet/add_photo_bottomsheet.dart';
import 'airbnb_widgets/add_house_photo_widget.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddHousePhotoController(),
      builder: (AddHousePhotoController controller) {
        return Scaffold(
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
                      CloseButtonWidget(),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Upload photos',
                              style: AppTextStyles.notificationDateSection,
                            ),
                            Text('1 item slected',
                                style: AppTextStyles.bodyTextStyle.copyWith(
                                    color: AppColors.secondaryTextColor)),
                          ],
                        ),
                      ),
                      AddButtonWidget(onTap: () {
                        Get.bottomSheet(AddPhotoBottomsheet());
                      })
                    ],
                  ),
                  AppGaps.hGap40,
                  Stack(
                    children: [
                      Obx(() {
                        if (controller.pickedImage.value != null) {
                          return Container(
                              width: 173,
                              height: 173,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  controller.pickedImage.value!,
                                  fit: BoxFit.fill,
                                ),
                              ));
                        } else {
                          return Text('No image captured.');
                        }
                      }),
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
                                  color: AppColors.inputFieldBorderColor)),
                          child: Center(
                              child: SvgPicture.asset(
                                  AppAssetImages.trashSVGLogoLine)),
                        ),
                      ),
                    ],
                  )
                ],
              )),
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
