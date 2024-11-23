import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/add_house_photo.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditPhotoBottomsheet extends StatelessWidget {
  const EditPhotoBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddHousePhotoController(),
      builder: (AddHousePhotoController controller) {
        return SizedBox(
          height: context.height * 0.3,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.primaryColor,
                    )),
              ),
              body: SafeArea(
                  child: CustomScaffoldBodyWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap15,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 98,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(color: AppColors.dottedColor)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0,
                                      top: 12,
                                      bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RawButtonWidget(
                                          onTap: () {},
                                          child: Text(
                                            'Move forward',
                                            style: AppTextStyles
                                                    .SmallXBoldTextStyle
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor),
                                          )),
                                      SvgPicture.asset(
                                          AppAssetImages.rightArrowSVGLogoLine)
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: AppColors.secondaryTextColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RawButtonWidget(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.choosePhotos);
                                          },
                                          child: Text(
                                            'Take a photo',
                                            style: AppTextStyles
                                                    .SmallXBoldTextStyle
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor),
                                          )),
                                      SvgPicture.asset(
                                          AppAssetImages.starSVGLogoLine)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 49,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: AppColors.dottedColor)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0, top: 12, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RawButtonWidget(
                                      onTap: () {},
                                      child: Text(
                                        'Remove',
                                        style: AppTextStyles.SmallXBoldTextStyle
                                            .copyWith(
                                                color: AppColors.primaryColor),
                                      )),
                                  SvgPicture.asset(
                                      AppAssetImages.trashSVGLogoLine)
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ],
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
