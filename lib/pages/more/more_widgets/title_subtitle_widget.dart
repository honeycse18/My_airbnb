import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? style;
  const TitleSubtitleWidget(
      {this.title = '', this.subtitle = '', this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != '')
          Text(
            title,
            style: style == null
                ? AppTextStyles.bodyLargeSemiboldTextStyle
                    .copyWith(color: AppColors.primaryTextColor)
                : AppTextStyles.bodyMediumLargeTextStyle
                    .copyWith(color: AppColors.primaryTextColor),
          ),
        AppGaps.hGap10,
        if (subtitle != '')
          Text(subtitle,
              maxLines: 3,
              style: AppTextStyles.bodyTextStyle.copyWith(
                color: AppColors.secondaryTextColor,
              )),
      ],
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String text;

  const CustomTextWidget({this.text = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (text != '')
          Text(text,
              style: AppTextStyles.bodyLargeTextStyle
                  .copyWith(color: AppColors.primaryTextColor)),
      ],
    );
  }
}

class TitleSubtitleSelectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  const TitleSubtitleSelectionWidget(
      {this.title = '', this.subtitle = '', required this.img, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != '')
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: AppTextStyles.bodyLargeTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
              ),
            Row(
              children: [
                SvgPicture.asset(AppAssetImages.greentikSVGLogoLine),
                AppGaps.wGap100,
                SvgPicture.asset(img),
              ],
            )
          ],
        ),
        AppGaps.hGap20,
        if (subtitle != '')
          Text(subtitle,
              style: AppTextStyles.bodyTextStyle
                  .copyWith(color: AppColors.secondaryTextColor)),
      ],
    );
  }
}
