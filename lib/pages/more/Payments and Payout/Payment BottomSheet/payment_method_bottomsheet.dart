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
import 'package:get/get_connect/http/src/utils/utils.dart';

class PaymentMethodBottomsheetController extends GetxController {}

class PaymentMethodBottomsheet extends StatelessWidget {
  const PaymentMethodBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PaymentMethodBottomsheetController(),
      builder: (PaymentMethodBottomsheetController controller) {
        return SizedBox(
          height: context.height * 0.25,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: BottomSheetAppBar(
                title: 'Add payment method',
              ),
              body: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.hGap20,
                  RawButtonWidget(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              AppAssetImages.paypalIconSVGLogoLine),
                          AppGaps.wGap12,
                          Text(
                            'PayPal',
                            style: AppTextStyles.bodyLargeTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppGaps.hGap26,
                  Divider(
                    thickness: 1,
                    color: AppColors.dottedColor,
                  ),
                  AppGaps.hGap20,
                  RawButtonWidget(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              AppAssetImages.dcCardIconSVGLogoLine),
                          AppGaps.wGap12,
                          Text(
                            'credit or debit card',
                            style: AppTextStyles.bodyLargeTextStyle
                                .copyWith(color: AppColors.primaryTextColor),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
