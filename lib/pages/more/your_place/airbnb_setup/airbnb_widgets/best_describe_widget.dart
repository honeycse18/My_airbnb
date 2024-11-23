import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescribeListItemWidget extends StatelessWidget {
  final bool hasShadow;
  final String PlaceOption;

  final int index;
  final BestPlaceOptionModel cancelReason;
  final BestPlaceOptionModel selectedCancelReason;
  final int selectedPlaceMethodIndex;
  final void Function()? onTap;
  final String img;
  const DescribeListItemWidget({
    super.key,
    required this.hasShadow,
    required this.PlaceOption,
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
                padding: EdgeInsets.all(20.0),
                height: 105,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: hasShadow
                            ? AppColors.primaryColor
                            : AppColors.dottedColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: SvgPicture.asset(img)),
                    AppGaps.hGap5,
                    Text(
                      PlaceOption,
                      style: AppTextStyles.bodyLargeBoldTextStyle
                          .copyWith(color: AppColors.primaryTextColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
