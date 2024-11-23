import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_gaps.dart';

class MyworkBottomsheetController extends GetxController {
  TextEditingController messageController = TextEditingController();
  bool isSelected = false;
  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class MyworkBottomsheet extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final String hintText;
  final Widget? prefixIcon;
  MyworkBottomsheet(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.hintText,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MyworkBottomsheetController(),
      builder: (MyworkBottomsheetController controller) {
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
                          title,
                          style: AppTextStyles.semiSmallXBoldTextStyle,
                        ),
                        AppGaps.hGap10,
                        Column(
                          children: [
                            Center(child: subtitle),
                            AppGaps.hGap25,
                            CustomTextFormField(
                              prefixIcon: prefixIcon,
                              maxLines: 1,
                              controller: controller.messageController,
                              hintText: hintText,
                            ),
                            AppGaps.hGap10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('0/40 ',
                                    style: AppTextStyles.bodyBoldTextStyle
                                        .copyWith(
                                            color: AppColors.primaryTextColor)),
                                Text('characters available',
                                    style: AppTextStyles.bodyBoldTextStyle
                                        .copyWith(
                                            color:
                                                AppColors.secondaryTextColor)),
                              ],
                            ),
                          ],
                        ),
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
