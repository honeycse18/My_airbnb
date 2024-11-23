import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

import '../../../../constants/app_gaps.dart';

class BornInfoBottomsheetController extends GetxController {
  final _controller = ValueNotifier(false);
  RxBool theme = false.obs;
}

class BornInfoBottomsheet extends StatelessWidget {
  BornInfoBottomsheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BornInfoBottomsheetController(),
      builder: (BornInfoBottomsheetController controller) {
        return SizedBox(
          height: context.height * 0.6,
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
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Decade you were born',
                          style: AppTextStyles.semiSmallXBoldTextStyle,
                        ),
                        AppGaps.hGap10,
                        Text(
                          'Don\'t worry, other people won\'t be able to see your exact birthday',
                          style: AppTextStyles.labelTextStyle
                              .copyWith(color: AppColors.secondaryTextColor),
                        ),
                        AppGaps.hGap30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Show the decade I was born',
                                  style: AppTextStyles.labelTextStyle
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                                AppGaps.hGap5,
                                Text(
                                  'Born in the 00s',
                                  style: AppTextStyles.labelTextStyle.copyWith(
                                      color: AppColors.secondaryTextColor),
                                ),
                              ],
                            ),
                            AdvancedSwitch(
                              controller: controller._controller,
                              enabled: true,
                              activeColor: AppColors.primaryColor,
                              height: 30.0,
                              width: 45.0,
                              onChanged: (value) {
                                controller._controller.addListener(() {
                                  if (controller._controller.value) {
                                    controller.theme = true.obs;
                                  } else {
                                    controller.theme = false.obs;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Save',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
