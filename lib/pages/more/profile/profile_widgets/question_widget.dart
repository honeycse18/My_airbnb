/*<------- ExpansionTile widget ------>*/
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionWidget extends StatelessWidget {
  final String img;
  final String title;
  final void Function() onTap;
  QuestionWidget({
    Key? key,
    required this.img,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                img,
                color: AppColors.primaryColor,
              ),
              AppGaps.wGap12,
              Text(title),
            ],
          ),
          IconButton(
              onPressed: onTap,
              icon: SvgPicture.asset(AppAssetImages.arrowRightSVGLogoLine))
        ]);
  }
}
