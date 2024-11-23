import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/your_place/match_superhost/lasts_fond_superhost_bottomsheet.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:get/get.dart';

class MatchSuperHostController extends GetxController {}

class MatchSuperHostView extends StatelessWidget {
  const MatchSuperHostView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MatchSuperHostController(),
      builder: (MatchSuperHostController controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.inputFieldBorderColor)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )),
            ),
            body: SafeArea(
                child: CustomScaffoldBodyWidget(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/intro_logo.png'),
                    LinearPercentIndicator(
                      width: 350.0,
                      lineHeight: 30.0,
                      center: Text(
                        "downloading airbnb host 99.4%",
                        style: AppTextStyles.titlesemiSmallMediumTextStyle
                            .copyWith(color: AppColors.primaryTextColor),
                      ),
                      linearStrokeCap: LinearStrokeCap.butt,
                      backgroundColor: Colors.transparent,
                      progressColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            )),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomStretchedButtonWidget(
                onTap: () {
                  Get.bottomSheet(
                      isScrollControlled: true,
                      LastsFondSuperhostBottomsheet());
                },
                child: Text(
                  'Get Started',
                  style: AppTextStyles.semiMediumBoldTextStyle,
                ),
              ),
            ));
      },
    );
  }
}
