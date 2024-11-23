import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeImageContentWidget extends StatelessWidget {
  final String localImageLocation;
  final String subtitle;
  final double widthSize;
  final double HeightSize;
  final double textheight;

  const HomeImageContentWidget({
    Key? key,
    required this.localImageLocation,
    required this.subtitle,
    required this.widthSize,
    required this.HeightSize,
    required this.textheight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: HeightSize,
        width: widthSize,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Image.asset(
                  localImageLocation,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AppGaps.hGap5,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: widthSize,
                height: textheight,
                decoration: BoxDecoration(
                    color: AppColors.inputFieldBorderColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(3),
                        bottomRight: Radius.circular(3))),
                child: Center(
                  child: Text(subtitle,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.bodyLargeSemiboldTextStyle
                          .copyWith(color: AppColors.primaryTextColor)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DestinationImageContentWidget extends StatelessWidget {
  final String localImageLocation;
  final String subtitle;
  final double radius;

  const DestinationImageContentWidget({
    Key? key,
    required this.localImageLocation,
    required this.subtitle,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 69,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.buttonGreyColor),
              borderRadius: BorderRadius.circular(radius)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppGaps.hGap10,
              Image.asset(
                localImageLocation,
                height: 32,
                width: 32,
              ),
              AppGaps.hGap10,
            ],
          ),
        ),
        AppGaps.hGap8,
        Center(
          child: Text(subtitle,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: AppTextStyles.smallestMediumTextStyle
                  .copyWith(color: AppColors.secondaryTextColor)),
        ),
      ],
    );
  }
}
