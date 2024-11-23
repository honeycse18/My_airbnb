import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  final bool hasShadow;
  final String labelText;

  const CustomTextFieldWithLabel({
    super.key,
    required this.hasShadow,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        hasShadow: hasShadow,
        paddingValue: const EdgeInsets.all(0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                height: 62,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: hasShadow
                            ? AppColors.primaryColor
                            : AppColors.dottedColor)),
                child: Container(
                  height: 41,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: labelText,
                            labelStyle: AppTextStyles.bodyTextStyle
                                .copyWith(color: AppColors.secondaryTextColor),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
