import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReservationListItemWidget extends StatelessWidget {
  final bool hasShadow;
  final String title;
  final String subtitle;
  final int index;
  final FirstReservationOptionModel cancelReason;
  final FirstReservationOptionModel selectedCancelReason;
  final int selectedPlaceMethodIndex;
  final int selectedAccountTypeOptionIndex;
  final void Function(Object?) radioOnChange;
  final void Function()? onTap;

  const ReservationListItemWidget({
    super.key,
    required this.hasShadow,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.selectedPlaceMethodIndex,
    this.onTap,
    required this.cancelReason,
    required this.selectedCancelReason,
    required this.selectedAccountTypeOptionIndex,
    required this.radioOnChange,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        hasShadow: hasShadow,
        paddingValue: const EdgeInsets.all(0),
        onTap: onTap,
        child: Container(
          height: 124,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                  color: hasShadow
                      ? AppColors.primaryColor
                      : AppColors.dottedColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyLargeBoldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                    AppGaps.hGap5,
                    Text(
                      subtitle,
                      maxLines: 3,
                      style: AppTextStyles.bodyRegularTextStyle
                          .copyWith(color: AppColors.secondaryTextColor),
                    ),
                  ],
                ),
              ),
              AppGaps.wGap40,
              AppGaps.wGap40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadioWidget(
                      value: index,
                      groupValue: selectedAccountTypeOptionIndex,
                      onChanged: radioOnChange),
                ],
              )
            ],
          ),
        ));
  }
}
