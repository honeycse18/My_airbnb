import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';

import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../more_widgets/title_subtitle_widget.dart';
import 'match_superhost_bottomsheet/chat_with_host_bottomsheet_widget.dart';

class MeetHostController extends GetxController {}

class MeetHost extends StatelessWidget {
  const MeetHost({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MeetHostController(),
      builder: (MeetHostController controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/hostPic.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.inputFieldBorderColor)),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )),
                ),
                Positioned(
                  top: 440.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            // Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            AppAssetImages.playSVGLogoLine,
                            height: 32.0,
                            width: 32.0,
                          )),
                      AppGaps.hGap40,
                      CustomScaffoldBodyWidget(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Meet Host',
                                style: AppTextStyles
                                    .titleSemiSmallSemiboldTextStyle
                                    .copyWith(color: AppColors.whiteColor)),
                            AppGaps.hGap16,
                            Row(
                              children: [
                                SvgPicture.asset(AppAssetImages.maplocation),
                                AppGaps.wGap16,
                                Text('Gomaring, Germany',
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: AppColors.whiteColor)),
                              ],
                            ),
                            AppGaps.hGap16,
                            Row(
                              children: [
                                SvgPicture.asset(AppAssetImages.userLogo),
                                AppGaps.wGap16,
                                Text('5 years of hosting experience',
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: AppColors.whiteColor)),
                              ],
                            ),
                            AppGaps.hGap16,
                            Row(
                              children: [
                                SvgPicture.asset(AppAssetImages.userLogo),
                                AppGaps.wGap16,
                                Text('Host home is rate ',
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: AppColors.whiteColor)),
                                SvgPicture.asset(
                                  AppAssetImages.starSVGLogoSolid,
                                  color: AppColors.whiteColor,
                                ),
                                Text('5.00',
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: AppColors.whiteColor)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 147,
                    color: AppColors.whiteColor,
                    child: RawButtonWidget(
                        onTap: () {
                          Get.bottomSheet(
                              isScrollControlled: true,
                              ChatWithHostBottomsheetWidget());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Center(
                            child: TitleSubtitleWidget(
                              title: 'Start a chat',
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
