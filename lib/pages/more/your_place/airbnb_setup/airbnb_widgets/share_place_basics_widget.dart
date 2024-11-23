import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharePlaceBasicsWidget extends StatelessWidget {
  final String title;
  final int initialCount;
  final void Function(int) onCountChanged;

  const SharePlaceBasicsWidget({
    Key? key,
    required this.title,
    required this.initialCount,
    required this.onCountChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt categoriesCount = initialCount.obs;

    void increment() {
      categoriesCount++;
      onCountChanged(categoriesCount.value);
    }

    void decrement() {
      if (categoriesCount > 0) {
        categoriesCount--;
        onCountChanged(categoriesCount.value);
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.labelTextStyle
                  .copyWith(color: AppColors.primaryTextColor),
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 28,
                  onPressed: decrement,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: AppColors.dottedColor,
                  ),
                ),
                Obx(
                  () => Text(
                    '${categoriesCount.value}',
                    style: AppTextStyles.bodyTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                ),
                IconButton(
                  iconSize: 28,
                  onPressed: increment,
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: AppColors.dottedColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        AppGaps.hGap24,
        Container(
          height: 1,
          color: AppColors.dottedColor,
        ),
      ],
    );
  }
}
