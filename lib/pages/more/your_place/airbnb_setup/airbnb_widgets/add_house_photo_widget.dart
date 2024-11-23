import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/models/fakeModel/option_model.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddHousePhotoWidget extends StatelessWidget {
  final String btnName;
  final String img;
  final void Function()? onTap;
  const AddHousePhotoWidget({
    super.key,
    required this.btnName,
    required this.img,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.dottedColor)),
      child: RawButtonWidget(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 20, bottom: 21),
          child: Row(
            children: [
              SvgPicture.asset(img),
              AppGaps.wGap12,
              Center(
                child: Text(
                  btnName,
                  style: AppTextStyles.bodyLargeTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
