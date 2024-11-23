import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsAddressFormFieldControllerWidget extends GetxController {
  TextEditingController addressController = TextEditingController();
}

class DetailsAddressFormFieldWidget extends StatelessWidget {
  final String labelText;

  final void Function()? onTap;
  const DetailsAddressFormFieldWidget(
      {required this.labelText, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DetailsAddressFormFieldControllerWidget(),
        builder: (DetailsAddressFormFieldControllerWidget controller) {
          return Column(
            children: [
              TextField(
                controller: controller.addressController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  labelText: 'Street address',
                  labelStyle: AppTextStyles.bodyTextStyle.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                ),
              ),
              TextField(
                controller: controller.addressController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                ),
              ),
              TextField(
                controller: controller.addressController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                ),
              ),
              TextField(
                controller: controller.addressController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                ),
              ),
              TextField(
                controller: controller.addressController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dottedColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                ),
              )
            ],
          );
        });
  }
}
