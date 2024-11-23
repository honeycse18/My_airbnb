import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DecideReservationListItemWidget extends StatelessWidget {
  final bool hasShadow;
  final String title;
  final String subtitle;
  final String img;
  final int index;
  final GuestPlaceOptionModel cancelReason;
  final GuestPlaceOptionModel selectedCancelReason;
  final int selectedPlaceMethodIndex;

  final void Function()? onTap;

  const DecideReservationListItemWidget({
    super.key,
    required this.hasShadow,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.index,
    required this.selectedPlaceMethodIndex,
    this.onTap,
    required this.cancelReason,
    required this.selectedCancelReason,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        hasShadow: hasShadow,
        paddingValue: const EdgeInsets.all(0),
        onTap: onTap,
        child: Container(
          height: 103,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                  color: hasShadow
                      ? AppColors.primaryColor
                      : AppColors.dottedColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    AppGaps.hGap35,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SvgPicture.asset(img)],
              )
            ],
          ),
        ));
  }
}
