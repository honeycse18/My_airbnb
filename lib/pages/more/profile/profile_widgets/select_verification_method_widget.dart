import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

/// Payment option list tile widget from checkout screen
class SelectVerificationMethodWidget extends StatelessWidget {
  const SelectVerificationMethodWidget({
    super.key,
    required this.verificationOption,
    required this.index,
    required this.selectedVerificationOptionIndex,
    required this.radioOnChange,
    this.onTap,
    required this.cancelReason,
    required this.selectedCancelReason,
  });

  final String verificationOption;
  final int index;
  final OptionModel cancelReason;
  final OptionModel selectedCancelReason;
  final int selectedVerificationOptionIndex;
  final void Function(Object?) radioOnChange;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  verificationOption,
                  style: AppTextStyles.labelTextStyle,
                ),
                AppGaps.wGap16,
                CustomRadioWidget(
                    value: index,
                    groupValue: selectedVerificationOptionIndex,
                    onChanged: radioOnChange),
              ],
            ),
            AppGaps.hGap10,
            Divider(
              color: AppColors.secondaryTextColor,
            ),
          ],
        ));
  }
}
