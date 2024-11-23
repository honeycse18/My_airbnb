import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info.dart';
import 'package:airbnb_app/pages/more/personal_info/personal_info_widgets/textfield_with_label.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  final String title;
  final String btnText;
  final String subtitle;
  final Widget expandWidget;
  final double width;
  final bool expand;
  final void Function()? btnOnTap;
  final void Function()? onTap;

  final bool isClicked = true;
  const CustomExpansionTileWidget({
    Key? key,
    required this.expandWidget,
    required this.title,
    required this.btnText,
    required this.width,
    required this.expand,
    required this.subtitle,
    this.btnOnTap,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                ],
              ),
            ),
            CustomTightTextButtonWidget(
              onTap: onTap,
              child: Text(expand ? 'Cancel' : 'Edit',
                  style: AppTextStyles.bodyLargeTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryColor,
                  )),
            ),
          ],
        ),
        AppGaps.hGap8,
        if (expand)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: AppTextStyles.SmallTextStyle.copyWith(
                    color: AppColors.secondaryTextColor),
              ),
              AppGaps.hGap20,
              expandWidget,
              AppGaps.hGap24,
              SizedBox(
                width: width,
                child: CustomStretchedButtonWidget(
                  onTap: btnOnTap,
                  child: Text(
                    btnText,
                    style: AppTextStyles.semiSmallXBoldTextStyle,
                  ),
                ),
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
