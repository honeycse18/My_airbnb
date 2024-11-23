import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/profile/profile_widgets/textfield_widget.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileAddressBottomSheetController extends GetxController {
  TextEditingController searchController = TextEditingController();
  String? _address;
}

class EditProfileAddressBottomSheet extends StatelessWidget {
  const EditProfileAddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditProfileAddressBottomSheetController(),
      builder: (EditProfileAddressBottomSheetController controller) {
        return SizedBox(
          height: context.height * 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.primaryColor,
                      )),
                ),
                body: SafeArea(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: CustomScaffoldBodyWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Where you live',
                          style: AppTextStyles.titleSmallSemiboldTextStyle
                              .copyWith(color: AppColors.primaryTextColor),
                        ),
                        AppGaps.hGap20,
                        SearchFieldWidget(
                          img: AppAssetImages.searchSVGLogoLine,
                          hintext: "Search for an address",
                          height: 45,
                        ),
                        SizedBox(height: 20),
                        Text(
                          controller._address != null
                              ? "Selected Address: $controller._address"
                              : "No Address Selected",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomStretchedButtonWidget(
                    onTap: () {},
                    child: Text(
                      'Confirm Location',
                      style: AppTextStyles.semiMediumBoldTextStyle,
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
