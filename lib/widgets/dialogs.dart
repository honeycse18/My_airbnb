
import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/widgets/common/button.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
/*<------- Error Dialog ------>*/
  static Future<Object?> showErrorDialog(
      {String? titleText, required String messageText}) async {
    final String dialogTitle = titleText ?? 'Sorry';

    // }
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.whiteColor,
      titleWidget: Column(
        children: [
          Image.asset(AppAssetImages.timerIconImage),
          AppGaps.hGap16,
          Text(dialogTitle,
              style: AppTextStyles.titleSmallSemiboldTextStyle
                  .copyWith(color: Colors.red),
              textAlign: TextAlign.center),
        ],
      ),
      contentWidget: Text(messageText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLargeSemiboldTextStyle),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          onTap: () {
            Get.back();
          },
          buttonText: 'Done',
        )
      ],
    ));
  }

  /*<------- Success dialog ------>*/
  static Future<Object?> showSuccessDialog(
      {String? titleText, required String messageText, Widget? img}) async {
    final String dialogTitle = titleText ?? 'Success';
    return await Get.dialog(AlertDialogWidget(
      backgroundColor: AppColors.whiteColor,
      titleWidget: Column(
        children: [
          AppGaps.hGap20,
          Container(child: img),
          AppGaps.hGap40,
          Text(dialogTitle,
              style: AppTextStyles.titleSemiSmallSemiboldTextStyle
                  .copyWith(color: AppColors.primaryTextColor),
              textAlign: TextAlign.center),
        ],
      ),
      contentWidget: Text(messageText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLargeTextStyle
              .copyWith(color: AppColors.secondaryTextColor)),
      actionWidgets: [
        CustomStretchedTextButtonWidget(
          onTap: () {
            Get.back();
          },
          buttonText: 'Done',
        )
      ],
    ));
  }

/*<------- Confirm dialog ------>*/
  static Future<Object?> showConfirmDialog({
    String? titleText,
    required String messageText,
    required Future<void> Function() onYesTap,
    void Function()? onNoTap,
    bool shouldCloseDialogOnceYesTapped = true,
    String? yesButtonText,
    String? noButtonText,
  }) async {
    return await Get.dialog(
      AlertDialogWidget(
        backgroundColor: AppColors.whiteColor,
        titleWidget: Column(
          children: [
            // Image.asset(AppAssetImages.confirmImage),
            AppGaps.hGap16,
            Text(titleText ?? 'Confirm',
                style: AppTextStyles.titleSmallSemiboldTextStyle
                    .copyWith(color: const Color(0xFF3B82F6)),
                textAlign: TextAlign.center),
          ],
        ),
        contentWidget: Text(
          messageText,
          style: AppTextStyles.bodyLargeSemiboldTextStyle,
          textAlign: TextAlign.center,
        ),
        actionWidgets: [
          Row(
            children: [
              Expanded(
                child: CustomStretchedOutlinedTextButtonWidget(
                  buttonText: noButtonText ?? 'No',
                  onTap: onNoTap ??
                      () {
                        Get.back();
                      },
                ),
              ),
              AppGaps.wGap12,
              Expanded(
                child: CustomStretchedTextButtonWidget(
                  buttonText: yesButtonText ?? 'Yes',
                  onTap: () async {
                    await onYesTap();
                    if (shouldCloseDialogOnceYesTapped) Get.back();
                  },
                ),
              ),
            ],
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<Object?> showProcessingDialog({String? message}) async {
    return await Get.dialog(
        AlertDialogWidget(
          titleWidget: Text(message ?? 'Processing',
              style: AppTextStyles.headlineLargeBoldTextStyle,
              textAlign: TextAlign.center),
          contentWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              AppGaps.hGap16,
              Text('Please Wait'),
            ],
          ),
        ),
        barrierDismissible: false);
  }
}
