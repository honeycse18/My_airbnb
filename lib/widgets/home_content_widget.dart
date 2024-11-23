import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;
  // final Widget child;
  const HomeContentWidget(
      {required this.title,
      this.subtitle = '',
      this.onTap,
      // required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomScaffoldBodyWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                    .copyWith(color: AppColors.primaryTextColor),
              ),
              RawButtonWidget(
                  onTap: onTap,
                  child: Row(
                    children: [
                      if (subtitle != '')
                        Text(
                          subtitle,
                          style: AppTextStyles.bodySemiboldTextStyle
                              .copyWith(color: AppColors.primaryColor),
                        ),
                    ],
                  ))
            ],
          ),
        ),
        AppGaps.hGap25,
        //  Container(
        //     child: child,
        //   )
      ],
    );
  }
}
