import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/airbnb_setup_bottomsheet/confirm_address_details_bottomsheet.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmAddressBottomSheetController extends GetxController {}

class ConfirmAddressBottomSheet extends StatelessWidget {
  const ConfirmAddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ConfirmAddressBottomSheetController(),
      builder: (ConfirmAddressBottomSheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: CoreWidgets.appBarWidget(
                  hasBackButton: true,
                  screenContext: context,
                  titleWidget: Text(
                    'Confirm your address',
                    style: AppTextStyles.notificationSemiBoldDateSection
                        .copyWith(color: AppColors.primaryTextColor),
                  )),
              body: SafeArea(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: CustomScaffoldBodyWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppGaps.hGap40,
                      SearchFieldWidget(
                        img: AppAssetImages.locationSVGLogoLine,
                        hintext: 'Search',
                        height: 40,
                      ),
                      AppGaps.hGap40,
                      RawButtonWidget(
                        onTap: () {
                          Get.bottomSheet(
                              isScrollControlled: true,
                              ConfirmAddressDetailsBottomSheet());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                AppAssetImages.currentLocationSVGLogoLine,
                                height: 16,
                                width: 16),
                            AppGaps.wGap12,
                            Text('Use my current location',
                                style: AppTextStyles.bodySmallMediumTextStyle
                                    .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.secondaryTextColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
