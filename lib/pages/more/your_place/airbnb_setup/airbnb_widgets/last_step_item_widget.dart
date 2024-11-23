import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class LastStepItemWidget extends StatelessWidget {
  final bool hasShadow;
  final String text;
  final bool isChecked;
  final int index;
  final void Function(bool)? onCheckboxChanged;
  final VoidCallback? onTap;

  const LastStepItemWidget({
    super.key,
    required this.hasShadow,
    required this.text,
    required this.index,
    required this.isChecked,
    this.onCheckboxChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.bodyLargeTextStyle.copyWith(
              color: AppColors.primaryTextColor,
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
