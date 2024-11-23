import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_widgets/textfield_with_label.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoWidget extends StatelessWidget {
  final String title;
  final String btnText;
  final String subtitle;

  final void Function()? onTap;

  final bool isClicked = true;
  const PersonalInfoWidget({
    Key? key,
    required this.title,
    required this.btnText,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLargeTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap8,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subtitle,
                          maxLines: 3,
                          style: AppTextStyles.SmallTextStyle.copyWith(
                              color: AppColors.secondaryTextColor),
                        ),
                      ),
                    ],
                  ),
                  AppGaps.hGap20,
                ],
              ),
            ),
            CustomTightTextButtonWidget(
              onTap: onTap,
              child: Text('Edit',
                  style: AppTextStyles.bodyLargeTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryColor,
                  )),
            ),
          ],
        ),
        Divider(
          color: AppColors.dottedColor,
        ),
        AppGaps.hGap10,
      ],
    );
  }
}
