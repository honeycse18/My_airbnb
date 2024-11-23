import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class GoProfileContentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonName;
  final void Function()? onTap;
  GoProfileContentWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonName,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 64.0,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.inputFieldBorderColor),
          borderRadius: BorderRadius.circular(2.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyLargeBoldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmallMediumTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
              ],
            ),
            RawButtonWidget(
              onTap: onTap,
              child: Text(
                buttonName,
                style: AppTextStyles.bodyLargeBoldTextStyle.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
