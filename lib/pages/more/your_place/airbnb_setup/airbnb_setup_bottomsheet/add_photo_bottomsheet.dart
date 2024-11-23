import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/pages/more/your_place/airbnb_setup/add_house_photo.dart';
import 'package:airbnb_app/routes/routes.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhotoBottomsheet extends StatelessWidget {
  const AddPhotoBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AddHousePhotoController(),
      builder: (AddHousePhotoController controller) {
        return SizedBox(
          height: context.height * 0.2,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
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
                  child: CustomScaffoldBodyWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap25,
                    RawButtonWidget(
                        onTap: () {
                          Get.toNamed(AppRoutes.choosePhotos);
                        },
                        child: Text(
                          'Upload from your device',
                          style: AppTextStyles.SmallXBoldTextStyle.copyWith(
                              color: AppColors.primaryColor),
                        )),
                    AppGaps.hGap24,
                    RawButtonWidget(
                        onTap: () {
                          controller.pickImageFromCamera();
                          controller.update();
                        },
                        child: Text(
                          'Take a photo',
                          style: AppTextStyles.SmallXBoldTextStyle.copyWith(
                              color: AppColors.primaryColor),
                        )),
                    AppGaps.hGap24,
                  ],
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
