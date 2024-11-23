import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart'; // Updated: Importing images
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/common/button.dart'; // Updated: Custom button widget
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {}

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GetStartedController(),
      builder: (GetStartedController controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssetImages.hostLogo,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 400,
                    left: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    AppAssetImages.playSVGLogoLine,
                                    height: 32.0,
                                    width: 32.0,
                                  )),
                              AppGaps.wGap30,
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    AppAssetImages.muteSVGLogoLine,
                                    height: 32.0,
                                    width: 32.0,
                                  )),
                            ],
                          ),
                          AppGaps.hGap42,
                          CustomScaffoldBodyWidget(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Congratulations, Ronald M. Davis',
                                    style: AppTextStyles
                                        .titleSemiSmallSemiboldTextStyle
                                        .copyWith(color: Colors.white)),
                                AppGaps.hGap12,
                                Text(
                                    'From one Host to another—welcome aboard. Thank you for sharing your home and helping to create incredible experiences for our guests.',
                                    maxLines: 3,
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: Colors.white)),
                                AppGaps.hGap40,
                                Image.asset(
                                  AppAssetImages.signImage,
                                ),
                                AppGaps.hGap4,
                                Text('Brian Chesky, CEO',
                                    style: AppTextStyles.bodyTextStyle
                                        .copyWith(color: Colors.white))
                              ],
                            ),
                          )
                        ]))
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16.0),
            child: DButton(
              onTap: () {},
              child: Text(
                'Let’s get started',
                style: AppTextStyles.semiMediumBoldTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
