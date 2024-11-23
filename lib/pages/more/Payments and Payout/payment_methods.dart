import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'Payment BottomSheet/payment_method_bottomsheet.dart';

class PaymentMethodsController extends GetxController {}

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentMethodsController(),
      builder: (PaymentMethodsController controller) {
        return Scaffold(
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGaps.hGap24,
                BackButtonWidget(),
                AppGaps.hGap20,
                Text(
                  'Payments methods',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap10,
                Text(
                  'Add payments  address associated with your account, and we’ll email you a link to reset you password',
                  style: AppTextStyles.bodyRegularTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap40,
                Container(
                  width: 252,
                  child: CustomStretchedButtonWidget(
                    onTap: () {
                      Get.bottomSheet(
                          isScrollControlled: true, PaymentMethodBottomsheet());
                    },
                    child: Text(
                      'Add payment method',
                      style: AppTextStyles.semiSmallXBoldTextStyle,
                    ),
                  ),
                ),
                AppGaps.hGap40,
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.dottedColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              AppAssetImages.paymentCardIconSVGLogoLine),
                          AppGaps.hGap20,
                          Text(
                            'make all payments through Airbnb',
                            style: AppTextStyles.labelTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                          AppGaps.hGap20,
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 4.0,
                              children: [
                                Baseline(
                                  baseline: 14.0,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text(
                                    'always pay and communicate through Airbnb to ensure you\'re protected under our',
                                    style: AppTextStyles.bodyRegularTextStyle
                                        .copyWith(
                                            color:
                                                AppColors.secondaryTextColor),
                                  ),
                                ),
                                Baseline(
                                  baseline: 14.0,
                                  baselineType: TextBaseline.alphabetic,
                                  child: CustomTightTextButtonWidget(
                                    onTap: () {
                                      // Get.toNamed(AppPageNames.termsConditionScreen);
                                    },
                                    child: Text(
                                      'Terms of service,',
                                      style: AppTextStyles.bodyRegularTextStyle
                                          .copyWith(
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Baseline(
                                  baseline: 14.0,
                                  baselineType: TextBaseline.alphabetic,
                                  child: CustomTightTextButtonWidget(
                                    onTap: () {
                                      // Get.toNamed(AppPageNames.termsConditionScreen);
                                    },
                                    child: Text(
                                      'Payment Terms Of Service,',
                                      style: AppTextStyles.bodyRegularTextStyle
                                          .copyWith(
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Baseline(
                                  baseline: 14.0,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text(
                                    'cancellation, and other safeguards.',
                                    style: AppTextStyles.bodyRegularTextStyle
                                        .copyWith(
                                            color:
                                                AppColors.secondaryTextColor),
                                  ),
                                ),
                              ]),
                          AppGaps.hGap20,
                          CustomTightTextButtonWidget(
                            onTap: () {
                              // Get.toNamed(AppPageNames.termsConditionScreen);
                            },
                            child: Text(
                              'Learn more',
                              style: AppTextStyles.bodyTextStyle.copyWith(
                                color: AppColors.primaryTextColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )),
        );
      },
    );
  }
}
