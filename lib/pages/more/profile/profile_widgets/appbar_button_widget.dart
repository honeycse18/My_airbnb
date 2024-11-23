/*<------- AppBarButton widget ------>*/
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';

class AppbarButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  AppbarButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16.0),
      child: Container(
        height: 37,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: AppColors.inputFieldBorderColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: RawButtonWidget(
            onTap: onTap,
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.bodyMediumTextStyle.copyWith(
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
