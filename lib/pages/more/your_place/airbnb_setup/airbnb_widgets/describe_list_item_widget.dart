import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/choice_chips_widget.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DescribeListItemWidget extends StatelessWidget {
  final bool hasShadow;
  final String AccountOption;
  final String AccountDesOption;
  final int index;
  final GuestPlaceOptionModel cancelReason;
  final GuestPlaceOptionModel selectedCancelReason;
  final int selectedAccountTypeOptionIndex;
  final void Function(Object?) radioOnChange;
  final void Function()? onTap;
  final String img;
  const DescribeListItemWidget({
    super.key,
    required this.hasShadow,
    required this.AccountOption,
    required this.AccountDesOption,
    required this.index,
    required this.selectedAccountTypeOptionIndex,
    required this.radioOnChange,
    this.onTap,
    required this.cancelReason,
    required this.img,
    required this.selectedCancelReason,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        hasShadow: hasShadow,
        paddingValue: const EdgeInsets.all(0),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 138,
          decoration: BoxDecoration(
              color: hasShadow ? AppColors.primary50Color : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(
                  color: hasShadow
                      ? AppColors.primaryColor
                      : AppColors.inputFieldBorderColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(img),
                  CustomRadioWidget(
                      value: index,
                      groupValue: selectedAccountTypeOptionIndex,
                      onChanged: radioOnChange),
                ],
              ),
              AppGaps.hGap5,
              Text(
                AccountOption,
                style: AppTextStyles.bodyLargeBoldTextStyle
                    .copyWith(color: AppColors.primaryTextColor),
              ),
              AppGaps.hGap5,
              Text(
                AccountDesOption,
                style: AppTextStyles.bodyRegularTextStyle
                    .copyWith(color: AppColors.secondaryTextColor),
              ),
            ],
          ),
        ));
  }
}
