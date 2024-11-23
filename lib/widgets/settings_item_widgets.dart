import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:airbnb_app/widgets/common/button.dart';

class SettingCardWidget extends StatelessWidget {
  final String itemName;
  final Widget child;
  SettingCardWidget({
    super.key,
    this.itemName = '',
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (itemName != '')
          Text(
            itemName,
            style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                .copyWith(color: AppColors.primaryTextColor),
          ),
        AppGaps.hGap16,
        child,
      ],
    );
  }
}

class SettingItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;
  SettingItemWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
      onTap: onTap,
      child: Column(
        children: [
          AppGaps.hGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: SvgPictureAssetWidget(
                  icon,
                  height: 20,
                  width: 20,
                ),
              ),
              AppGaps.wGap12,
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodyLargeTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
              ),
              SvgPictureAssetWidget(
                AppAssetImages.arrowRightSVGLogoLine,
                color: AppColors.SecondaryButton,
              ),
            ],
          ),
          AppGaps.hGap16,
          Divider(
            color: AppColors.dottedColor,
          ),
        ],
      ),
    );
  }
}
