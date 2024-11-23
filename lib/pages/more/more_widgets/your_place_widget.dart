import 'package:airbnb_app/constants/app_gaps.dart';

import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class YourPlaceWidget extends StatelessWidget {
  final void Function()? onTap;

  const YourPlaceWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
      onTap: onTap,
      child: Container(
        height: 94,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 16.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Airbnb your place',
                    style: AppTextStyles.semiMediumBoldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap5,
                  Text(
                    'It’ simple to get set up and \nstart earning',
                    style: AppTextStyles.bodySmallMediumTextStyle
                        .copyWith(color: AppColors.secondaryTextColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/place.png',
                    height: 85,
                    width: 98,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
