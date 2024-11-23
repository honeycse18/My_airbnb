import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/appbar_button_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TellUsYourPlaceController extends GetxController {
  

}

class TellUsYourPlaceScreen extends StatelessWidget {
  const TellUsYourPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TellUsYourPlaceController(),
      builder: (TellUsYourPlaceController controller) {
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
                  AppGaps.hGap26,
                  Center(child: Image.asset(AppAssetImages.tellUsImage)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssetImages.playBlackSVGLogoLine,
                        height: 32.0,
                        width: 32.0,
                      )),
                  AppGaps.hGap35,
                  Text(
                    'Step 1',
                    style: AppTextStyles.semiMediumBoldTextStyle.copyWith(
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  AppGaps.hGap10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Tell us about your place',
                          maxLines: 2,
                          style: AppTextStyles.titleLargeTextStyle.copyWith(
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppGaps.hGap16,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'In this step, we\'ll ask you which type of property you have and if guests will book the entire place or just a room. Then let us know the location and how many guests can stay.',
                          maxLines: 4,
                          style: AppTextStyles.bodyTextStyle.copyWith(
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.toNamed(AppRoutes.bestPlace);
                },
                child: Text(
                  'Get Started',
                  style: AppTextStyles.semiMediumBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
