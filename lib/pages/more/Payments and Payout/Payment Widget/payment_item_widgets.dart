import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:airbnb_app/widgets/common/button.dart';

class PaymentItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final void Function()? onTap;
  PaymentItemWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
      onTap: onTap,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
