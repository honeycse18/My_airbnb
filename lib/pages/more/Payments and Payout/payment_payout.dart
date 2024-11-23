import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/Payments%20and%20Payout/Payment%20Widget/payment_item_widgets.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPayoutController extends GetxController {}

class PaymentPayoutView extends StatelessWidget {
  const PaymentPayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentPayoutController(),
      builder: (PaymentPayoutController controller) {
        return Scaffold(
          body: SafeArea(
              child: CustomScaffoldBodyWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGaps.hGap24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonWidget(),
                    Text(
                      '\$-USD',
                      style: AppTextStyles.labelTextStyle.copyWith(
                          color: AppColors.primaryTextColor,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                AppGaps.hGap20,
                Text(
                  'Payments & Payouts',
                  style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap20,
                Text(
                  'Travel',
                  style: AppTextStyles.bodyMediumTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap20,
                PaymentItemWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.paymentMethod);
                  },
                  title: 'Payment methods',
                  icon: AppAssetImages.paymentIconSVGLogoLine,
                ),
                AppGaps.hGap30,
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Your payment',
                  icon: AppAssetImages.cardIconSVGLogoLine,
                ),
                AppGaps.hGap30,
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Credits & Coupons',
                  icon: AppAssetImages.couponIconSVGLogoLine,
                ),
                AppGaps.hGap40,
                Divider(
                  color: AppColors.dottedColor,
                  thickness: 1.0,
                ),
                AppGaps.hGap20,
                Text(
                  'Hosting',
                  style: AppTextStyles.bodyMediumTextStyle
                      .copyWith(color: AppColors.primaryTextColor),
                ),
                AppGaps.hGap20,
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Payout methods',
                  icon: AppAssetImages.payoutIconSVGLogoLine,
                ),
                AppGaps.hGap30,
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Transaction history',
                  icon: AppAssetImages.transactionIconSVGLogoLine,
                ),
                AppGaps.hGap30,
                PaymentItemWidget(
                  onTap: () {},
                  title: 'Donations',
                  icon: AppAssetImages.donationIconSVGLogoLine,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
