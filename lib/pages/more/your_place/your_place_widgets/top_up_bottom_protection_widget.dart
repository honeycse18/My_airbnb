import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class TopUpBottomProtectionWidget extends StatelessWidget {
  const TopUpBottomProtectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppGaps.hGap30,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextWidget(
              text: 'Airbnb',
            ),
            AppGaps.wGap20,
            CustomTextWidget(
              text: 'Competitors',
            ),
          ],
        ),
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Gust identity vacation',
            subtitle:
                'Our comprehensive verification system checks details such as name, address, government ID and more to confirm they identity of guests who book on Airbnb.',
            img: AppAssetImages.redtikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Reservation Screening',
            subtitle:
                'Our propriety technology analyzes hundreds of factors as in each reservation and block certain booking that show a high risk for disruptive parties and property damage.',
            img: AppAssetImages.redtikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: r'$3m Damage Protection',
            subtitle:
                'Airbnb reimburses you for damage caused by guests to your home and belongings and includes these specialized protections.',
            img: AppAssetImages.redtikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Art & Valuables', img: AppAssetImages.redtikSVGLogoLine),
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Auto & Boat', img: AppAssetImages.redtikSVGLogoLine),
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Pet Damage', img: AppAssetImages.redtikSVGLogoLine),
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Income Loss', img: AppAssetImages.redtikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: 'Deep Cleaning', img: AppAssetImages.redtikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: r'$1m Liability Insurance',
            subtitle:
                'our propriety technology analyzes hundreds of factors as in each reservation and block certain,',
            img: AppAssetImages.greentikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
        AppGaps.hGap20,
        TitleSubtitleSelectionWidget(
            title: '24-Hour Safety',
            subtitle:
                'Our propriety technology analyzes hundreds of factors as in each reservation and block certain,',
            img: AppAssetImages.greentikSVGLogoLine),
        AppGaps.hGap20,
        Divider(
          color: AppColors.secondaryTextColor,
        ),
      ],
    );
  }
}
