import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/more_widgets/title_subtitle_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactController extends GetxController {}

class EmergencyContact extends StatelessWidget {
  const EmergencyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EmergencyContactController(),
      builder: (EmergencyContactController controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: AppColors.primaryColor,
                )),
          ),
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppGaps.hGap24,

                  AppGaps.hGap40,
                  Text(
                    'Add at least one emergency contact',
                    style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                        .copyWith(color: AppColors.primaryTextColor),
                  ),
                  AppGaps.hGap10,
                  TitleSubtitleWidget(
                    subtitle:
                        'add a number so confirmed guests and Airbnb can get in touch. you can add other number choose how they’re used. add a number so confirmed guests  in touch. you can add other number choose how they’re used. ',
                  ),
                  AppGaps.hGap130,
                  AppGaps.hGap13,

                  Center(
                    child: Image.asset(AppAssetImages.emargencyImage),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
