import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../constants/app_gaps.dart';

class ReviewListingBottomSheetController extends GetxController {
  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class ReviewListingBottomSheet extends StatelessWidget {
  const ReviewListingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReviewListingBottomSheetController(),
      builder: (ReviewListingBottomSheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            AppAssetImages.niceHome,
                            fit: BoxFit.fill,
                            width: Get.width * 0.9,
                          ),
                        ),
                      ),
                      AppGaps.hGap37,
                      Text(
                        'Appstick house',
                        style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      AppGaps.hGap20,
                      Divider(
                        thickness: 1,
                        color: AppColors.dividerColor,
                      ),
                      AppGaps.hGap20,
                      Text(
                        'Entire home hosed by name',
                        style: AppTextStyles.labelTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      AppGaps.hGap20,
                      Divider(
                        thickness: 1,
                        color: AppColors.dividerColor,
                      ),
                      AppGaps.hGap20,
                      Text(
                        '4 gust - 1 bedroom - 1 bed - 1 bath',
                        style: AppTextStyles.bodyLargeTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                      AppGaps.hGap20,
                      Divider(
                        thickness: 1,
                        color: AppColors.dividerColor,
                      ),
                      AppGaps.hGap20,
                      Text(
                        'You’ll have a great time at this comfortable place to stay',
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                      AppGaps.hGap20,
                      Divider(
                        thickness: 1,
                        color: AppColors.dividerColor,
                      ),
                      AppGaps.hGap20,
                      Text(
                        'Amenities',
                        style: AppTextStyles.labelTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      AppGaps.hGap26,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Wifi',
                              style: AppTextStyles.bodyLargeTextStyle.copyWith(
                                  color: AppColors.secondaryTextColor)),
                          SvgPicture.asset(AppAssetImages.wifiSVGLogoLine),
                        ],
                      ),
                      AppGaps.hGap20,
                      Divider(
                        thickness: 1,
                        color: AppColors.dividerColor,
                      ),
                      AppGaps.hGap20,
                      Text(
                        'Location',
                        style: AppTextStyles.labelTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      AppGaps.hGap20,
                      Text(
                        'Khulna city bypass',
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(color: AppColors.secondaryTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
