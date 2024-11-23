import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/pages/more/your_place/your_place_widgets/top_up_bottom_protection_widget.dart';
import 'package:airbnb_app/pages/more/your_place/your_place_widgets/your_qs_ans_widget.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:airbnb_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/button.dart';

class AirbnbYourPlaceViewController extends GetxController {
  var nights = 1.0.obs;
  bool _isExpanded = false;
  double get costPerNight => 33;
  double get totalCost => nights.value * costPerNight;

  var tileExpanded = List<bool>.filled(5, false).obs;

  void toggleTile(int index) {
    tileExpanded[index] = !tileExpanded[index];
  }

  void updateNights(double value) {
    nights.value = value;
  }
}

class AirbnbYourPlaceView extends StatelessWidget {
  const AirbnbYourPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AirbnbYourPlaceViewController(),
      builder: (AirbnbYourPlaceViewController controller) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.inputFieldBorderColor)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )),
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.only(top: 15, right: 16.0),
              //     child: Container(
              //       height: 37,
              //       width: 92,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(40.0),
              //           border:
              //               Border.all(color: AppColors.inputFieldBorderColor)),
              //       child: Center(
              //           child: Text('Question?',
              //               style: AppTextStyles.bodyMediumTextStyle.copyWith(
              //                   color: AppColors.secondaryTextColor))),
              //     ),
              //   )
              // ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomScaffoldBodyWidget(
                        child: Column(
                          children: [
                            AppGaps.hGap30,
                            Text(
                              'Appstick home',
                              style: AppTextStyles.titlesemiSmallMediumTextStyle
                                  .copyWith(color: AppColors.primaryTextColor),
                            ),
                            AppGaps.hGap10,
                            Text(
                              'You could earn',
                              style: AppTextStyles.titleExtraXLargeBoldTextStyle
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            AppGaps.hGap30,
                            Obx(() => Text(
                                '\$${controller.totalCost.toStringAsFixed(0)}',
                                style: AppTextStyles
                                    .titleExtraXLargeBoldTextStyle
                                    .copyWith(color: AppColors.primaryColor))),
                            SizedBox(height: 10),
                            Obx(() => RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${controller.nights.value.toStringAsFixed(0)} night',
                                        style: AppTextStyles.bodyMediumTextStyle
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                decoration:
                                                    TextDecoration.underline),
                                      ),
                                      if (controller.nights.value > 1)
                                        TextSpan(
                                          text: 's',
                                          style: AppTextStyles
                                              .bodyMediumTextStyle
                                              .copyWith(
                                                  color: AppColors.primaryColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                        ),
                                      TextSpan(
                                        text:
                                            ' at an estimate \$${controller.costPerNight.toStringAsFixed(0)} a night',
                                        style: AppTextStyles.bodyMediumTextStyle
                                            .copyWith(
                                                color: AppColors
                                                    .secondaryTextColor),
                                      ),
                                    ],
                                  ),
                                )),
                            Slider(
                              value: controller.nights.value,
                              min: 1,
                              max: 30,
                              label:
                                  '${controller.nights.round().toString()} Night',
                              thumbColor: AppColors.primaryColor,
                              activeColor: AppColors.primaryColor,
                              inactiveColor: AppColors.buttonGreyColor,
                              divisions: 30,
                              allowedInteraction: SliderInteraction.slideThumb,
                              onChanged: (value) {
                                controller.updateNights(value);
                                controller.update();
                              },
                            ),
                            AppGaps.hGap20,
                            SearchFieldWidget(
                              img: AppAssetImages.searchSVGLogoLine,
                              hintext: '',
                              height: 56,
                            ),
                            AppGaps.hGap20,
                            Container(),
                            AppGaps.hGap20,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Airbnb it easily with\nairbnb setup',
                                style: AppTextStyles.semiSmallXBoldTextStyle
                                    .copyWith(
                                        color: AppColors.primaryTextColor),
                              ),
                            ),
                            AppGaps.hGap20,
                            Image.asset('assets/images/img.png'),
                            AppGaps.hGap40,
                            TitleSubtitleWidget(
                              title: 'One-to-one guidance from a superhot',
                              subtitle:
                                  'We’ll match you with a superhot in your area, who\’ll guide you from you first question to your first guest-by phone, video call, or chat.',
                            ),
                            AppGaps.hGap20,
                            TitleSubtitleWidget(
                              title:
                                  'An experienced guest for your first booking',
                              subtitle:
                                  'For your fist booking, you can to welcome an experienced gusset who has at least three stays and good track record on Airbnb',
                            ),
                            AppGaps.hGap20,
                            TitleSubtitleWidget(
                              title: 'Specialized support from Airbnb',
                              subtitle:
                                  'For your fist booking, you can to welcome an experienced gusset who has at least three stays and good track record on Airbnb',
                            ),
                            AppGaps.hGap30,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'aircover',
                                style: AppTextStyles
                                    .titleExtraXLargeBoldTextStyle
                                    .copyWith(
                                        color: AppColors.primaryTextColor),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'For host',
                                style:
                                    AppTextStyles.SmallXBoldTextStyle.copyWith(
                                        color: AppColors.primaryTextColor),
                              ),
                            ),
                            AppGaps.hGap20,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Airbnb it with\ntop-up-bottom protection',
                                style:
                                    AppTextStyles.SmallXBoldTextStyle.copyWith(
                                        color: AppColors.primaryTextColor),
                              ),
                            ),
                            TopUpBottomProtectionWidget(),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'Comparison is based on public information and free offerings by top competitor as of 10/22. ',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor)),
                              TextSpan(
                                  text: 'Find details and exclusions here.',
                                  style: AppTextStyles.bodyTextStyle.copyWith(
                                      color: AppColors.primaryTextColor))
                            ])),
                            AppGaps.hGap20,
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: 143,
                                child: Center(
                                  child:
                                      CustomStretchedOutlinedTextButtonWidget(
                                          minSize: Size(40, 44),
                                          borderColor: AppColors.dottedColor,
                                          textColor: AppColors.primaryColor,
                                          onTap: () {
                                            Get.toNamed(AppRoutes.learnMore);
                                          },
                                          appStyle: AppTextStyles.bodyTextStyle,
                                          buttonText: 'learn more'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppGaps.hGap20,
                      YourQsAnsWidget(),
                      AppGaps.hGap40,
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 622,
                              decoration: BoxDecoration(
                                  color: AppColors.profileContainerColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/images/superHost.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      AppGaps.hGap16,
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'still have questions?',
                                              style: AppTextStyles
                                                  .titlesemiSmallMediumTextStyle,
                                            ),
                                            AppGaps.hGap6,
                                            Container(
                                              width: 225,
                                              child: TitleSubtitleWidget(
                                                subtitle:
                                                    'get answers from an experienced superhost near you.',
                                              ),
                                            ),
                                            AppGaps.hGap16,
                                            Container(
                                              width: 236,
                                              child: Center(
                                                child:
                                                    CustomStretchedOutlinedTextButtonWidget(
                                                        minSize: Size(42, 44),
                                                        borderColor: AppColors
                                                            .dottedColor,
                                                        textColor: AppColors
                                                            .primaryTextColor,
                                                        onTap: () {
                                                          Get.toNamed(AppRoutes
                                                              .matchSuperHost);
                                                        },
                                                        appStyle: AppTextStyles
                                                            .bodyTextStyle,
                                                        buttonText:
                                                            'Match with a superhost'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 50,
                  child: CustomStretchedButtonWidget(
                    onTap: () {
                      Get.toNamed(AppRoutes.easyToGetStarted);
                    },
                    child: Text(
                      'Airbnb Setup',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )));
      },
    );
  }
}
