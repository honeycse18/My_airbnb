import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GuestPlaceTypeWidget extends StatelessWidget {
  final bool hasShadow;
  final String title;
  final String subtitle;

  final int index;
  final GuestPlaceOptionModel cancelReason;
  final GuestPlaceOptionModel selectedCancelReason;
  final int selectedPlaceMethodIndex;
  final void Function()? onTap;
  final String img;

  const GuestPlaceTypeWidget({
    super.key,
    required this.hasShadow,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.selectedPlaceMethodIndex,
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
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                height: 103,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.titlesemiSmallMediumTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                          AppGaps.hGap8,
                          Text(
                            subtitle,
                            maxLines: 3,
                            style: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          img,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
