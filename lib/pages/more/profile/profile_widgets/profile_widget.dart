import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileWidget extends StatelessWidget {
  final Widget img;
  final Widget? suffixIcon;
  final Widget? subtitle;
  final String name;
  final double padding;
  const ProfileWidget(
      {this.suffixIcon,
      this.name = '',
      required this.img,
      required this.padding,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            img,
            AppGaps.wGap16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGaps.hGap7,
                if (name != '')
                  Text(
                    name,
                    style: AppTextStyles.semiSmallXBoldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                AppGaps.hGap4,
                Container(child: subtitle)
              ],
            ),
          ],
        ),
        Align(alignment: Alignment.centerRight, child: suffixIcon),
      ],
    );
  }
}
