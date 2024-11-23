import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';

class YourQsAnsWidgetController extends GetxController {
  var nights = 1.0.obs;

  var tileExpanded = List<bool>.filled(5, false).obs;

  void toggleTile(int index) {
    tileExpanded[index] = !tileExpanded[index];
  }
}

class YourQsAnsWidget extends StatelessWidget {
  const YourQsAnsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: YourQsAnsWidgetController(),
        builder: (YourQsAnsWidgetController controller) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  color: AppColors.profileContainerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.hGap10,
                        Container(
                          height: 48,
                          width: 124,
                          child: Text(
                            'Your question, answered',
                            style: AppTextStyles.semiSmallXBoldTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ),
                        AppGaps.hGap30,
                        SizedBox(
                          height: 360,
                          child: ListView.builder(
                            itemCount: controller.tileExpanded.length,
                            itemBuilder: (context, index) {
                              return Obx(() => SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: ExpansionTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppGaps.hGap10,
                                          Text(
                                            'Is my place right for Airbnb',
                                            style: AppTextStyles
                                                .bodyLargeTextStyle,
                                          ),
                                          AppGaps.hGap20,
                                          Divider(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            'Details go here',
                                            style: AppTextStyles
                                                .bodyBoldTextStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .secondaryTextColor),
                                          ),
                                        ),
                                        if (controller.tileExpanded.length <= 4)
                                          Divider(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                      ],
                                      tilePadding: EdgeInsets.symmetric(
                                          horizontal: 0.0, vertical: 0.0),
                                      backgroundColor: Colors.transparent,
                                      collapsedBackgroundColor:
                                          Colors.transparent,
                                      collapsedIconColor:
                                          AppColors.primaryColor,
                                      iconColor: AppColors.primaryColor,
                                      textColor: AppColors.SecondaryButton,
                                      collapsedTextColor:
                                          AppColors.primaryColor,
                                      shape:
                                          Border.all(color: Colors.transparent),
                                      collapsedShape:
                                          Border.all(color: Colors.transparent),
                                      onExpansionChanged: (bool expanded) {
                                        controller.toggleTile(index);
                                      },
                                      initiallyExpanded:
                                          controller.tileExpanded[index],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
