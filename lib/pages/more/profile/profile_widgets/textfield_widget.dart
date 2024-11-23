import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SearchFieldWidgetController extends GetxController {
  TextEditingController searchController = TextEditingController();
}

class SearchFieldWidget extends StatelessWidget {
  final String hintext;
  final String img;

  final double height;
  const SearchFieldWidget(
      {required this.hintext,
      required this.img,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SearchFieldWidgetController(),
        builder: (SearchFieldWidgetController controller) {
          return Container(
              height: height,
              child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.inputFieldBorderColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.inputFieldBorderColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  prefixIcon: Container(
                    height: 16,
                    width: 16,
                    child: Center(
                      child: SvgPicture.asset(img),
                    ),
                  ),
                  hintText: hintext,
                  hintStyle: AppTextStyles.bodySmallMediumTextStyle,
                ),
                controller: controller.searchController,
              ));
        });
  }
}

class TextfieldWidgetController extends GetxController {
  TextEditingController searchController = TextEditingController();
}

class TextfieldWidget extends StatelessWidget {
  final String hintext;
  final String img;
  final double height;
  final void Function()? onTap;
  const TextfieldWidget(
      {required this.hintext,
      required this.height,
      required this.img,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TextfieldWidgetController(),
        builder: (TextfieldWidgetController controller) {
          return Container(
              height: height,
              child: TextField(
                onTap: () {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.dottedColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.dottedColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  hintText: hintext,
                  hintStyle: AppTextStyles.SmallTextStyle,
                  suffixIcon: RawButtonWidget(
                      onTap: onTap,
                      child: Container(
                        height: 16.5,
                        width: 15.0,
                        child: Center(
                          child: SvgPicture.asset(
                            img,
                          ),
                        ),
                      )),
                ),
                controller: controller.searchController,
              ));
        });
  }
}
