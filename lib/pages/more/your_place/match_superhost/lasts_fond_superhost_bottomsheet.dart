import 'package:airbnb_app/constants/app_gaps.dart';

import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../more_widgets/title_subtitle_widget.dart';

class LastsFondSuperhostBottomsheetController extends GetxController {}

class LastsFondSuperhostBottomsheet extends StatelessWidget {
  const LastsFondSuperhostBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LastsFondSuperhostBottomsheetController(),
      builder: (LastsFondSuperhostBottomsheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Scaffold(
              backgroundColor: AppColors.primaryColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/superHost.png',
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
                                          color:
                                              AppColors.inputFieldBorderColor)),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      AppGaps.hGap82,
                      Container(
                        height: 467,
                        decoration: BoxDecoration(
                            color: AppColors.profileContainerColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 30),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 163,
                                            child: Text(
                                              'last\'s fond you a superhost',
                                              style: AppTextStyles
                                                  .titleSemiSmallSemiboldTextStyle,
                                            ),
                                          ),
                                          Container(
                                            width: 268,
                                            child: TitleSubtitleWidget(
                                              subtitle:
                                                  'we’ll match you with an experienced host who can help you get started',
                                            ),
                                          ),
                                          AppGaps.hGap100,
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "By Selecting “Get Matched” You Agree To The\n",
                                                style: AppTextStyles
                                                        .SmallTextStyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .secondaryTextColor)),
                                            TextSpan(
                                                text: "Program Terms.",
                                                style: AppTextStyles
                                                        .SmallTextStyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryTextColor)),
                                          ])),
                                          AppGaps.hGap130,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                CustomStretchedButtonWidget(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.meethost);
                                  },
                                  child: Text(
                                    'Get Matched',
                                    style:
                                        AppTextStyles.semiMediumBoldTextStyle,
                                  ),
                                ),
                              ]),
                        ),
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
