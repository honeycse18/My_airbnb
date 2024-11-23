import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class AddDiscountWidget extends StatelessWidget {
  final bool hasShadow;
  final String text;
  final String title;
  final String subtitle;
  final int index;
  final bool isChecked;
  final void Function(bool)? onCheckboxChanged;

  const AddDiscountWidget({
    super.key,
    required this.hasShadow,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.isChecked,
    this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: hasShadow ? AppColors.primaryColor : AppColors.dottedColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyles.bodyLargeTextStyle.copyWith(
              color: isChecked
                  ? AppColors.primaryColor
                  : AppColors.secondaryTextColor,
            ),
          ),
          AppGaps.wGap44,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyLargeTextStyle,
                ),
                AppGaps.hGap10,
                Text(
                  subtitle,
                  style: AppTextStyles.bodyRegularTextStyle.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            activeColor: AppColors.primaryColor,
            value: isChecked,
            onChanged: (bool? value) {
              if (onCheckboxChanged != null) {
                onCheckboxChanged!(value ?? false);
              }
            },
          ),
        ],
      ),
    );
  }
}
