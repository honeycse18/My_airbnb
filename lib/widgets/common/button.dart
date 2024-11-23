import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:airbnb_app/constants/components.dart';
import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:airbnb_app/constants/images.dart';
import 'package:airbnb_app/constants/text_styles.dart';
import 'package:airbnb_app/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/* ---------< Close Button>--------*/

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        onTap: () {
          Get.back();
        },
        child: SvgPictureAssetWidget(
          AppAssetImages.arrowLeftSVGLogoLine,
          color: AppColors.primaryTextColor,
        ));
  }
}
// class BackButtonWidget extends StatelessWidget {
//   const BackButtonWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Get.back();
//         },
//         icon: Align(
//           alignment: Alignment.topLeft,
//           child: SvgPictureAssetWidget(
//             AppAssetImages.arrowLeftSVGLogoLine,
//             color: AppColors.primaryTextColor,
//           ),
//         ));
//   }
// }

class AddButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  const AddButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        onTap: onTap,
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.inputFieldBorderColor)),
          child: Center(
            child: Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
          ),
        ));
  }
}

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.inputFieldBorderColor)),
          child: Center(
            child: Icon(
              Icons.close,
              color: AppColors.primaryColor,
            ),
          ),
        ));
  }
}

class DButton extends StatelessWidget {
  final ValueGetter? onTap;
  final String? label;
  final bool? disabled;
  final Widget? child;

  const DButton({
    super.key,
    this.onTap,
    this.label,
    this.disabled,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        height: 54,
        width: 361,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.selectedButtonColor
              .withOpacity(disabled != null && disabled! ? 0.33 : 1),
        ),
        child: Center(
          child: child ??
              Text(label ?? "Label",
                  style: AppTextStyles.bodySemiboldTextStyle),
        ),
      ),
    );
  }
}

/*<------- Custom TextButton stretches the width of the screen with small elevation ------>*/
class CustomStretchedButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const CustomStretchedButtonWidget({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
                elevation: 10,
                shadowColor: AppColors.primaryTextColor.withOpacity(0.25),
                backgroundColor: onTap == null
                    ? AppColors.buttonGreyColor
                    : AppColors.primaryColor,
                minimumSize: const Size(30, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: child),
        ),
      ],
    );
  }
}

/*<--------Custom TextButton stretches------->*/
class CustomStretchedOutlinedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final Image? image;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? appStyle;
  final Size? minSize;
  final void Function()? onTap;

  const CustomStretchedOutlinedTextButtonWidget({
    Key? key,
    this.borderColor,
    this.textColor,
    this.onTap,
    required this.buttonText,
    this.image,
    this.appStyle,
    this.backgroundColor,
    this.minSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: backgroundColor,
              side: BorderSide(
                  color: borderColor ?? AppColors.inputFieldBorderColor,
                  width: 1),
              minimumSize: minSize ?? Size(44, 56),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (image != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: image,
                  ),
                Text(buttonText,
                    textAlign: TextAlign.center,
                    style: appStyle != null
                        ? AppTextStyles.bodyLargeTextStyle.copyWith(
                            color: textColor ?? AppColors.secondaryTextColor)
                        : AppTextStyles.bodyLargeTextStyle.copyWith(
                            color: textColor ?? AppColors.primaryTextColor)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Custom toggle button of tab widget
class CustomTabToggleButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final void Function()? onTap;
  const CustomTabToggleButtonWidget(
      {Key? key, required this.isSelected, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      animationDuration: Duration.zero,
      color: isSelected ? AppColors.whiteColor : Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.primaryTextColor),
          ),
        ),
      ),
    );
  }
}

class RawButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final double? borderRadiusValue;
  final Color? backgroundColor;

  const RawButtonWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadiusValue,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: borderRadiusValue != null
          ? BorderRadius.all(Radius.circular(borderRadiusValue!))
          : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadiusValue != null
            ? BorderRadius.all(Radius.circular(borderRadiusValue!))
            : null,
        child: child,
      ),
    );
  }
}

class CustomStretchedTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;
  const CustomStretchedTextButtonWidget({
    Key? key,
    this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: onTap == null
                    ? LinearGradient(colors: [
                        Color.lerp(AppColors.primaryColor, AppColors.whiteColor,
                                0.5) ??
                            AppColors.primaryColor.withOpacity(0.5),
                        Color.lerp(AppColors.primaryColor, AppColors.whiteColor,
                                0.5) ??
                            AppColors.primaryColor
                      ])
                    : LinearGradient(colors: [
                        AppColors.primaryColor,
                        Color.lerp(AppColors.primaryColor, AppColors.whiteColor,
                                0.1) ??
                            AppColors.primaryColor.withOpacity(0.4),
                      ])),
            child: TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    elevation: onTap == null ? 0 : 10,
                    shadowColor: AppColors.primaryColor.withOpacity(0.25),
                    // backgroundColor: onTap == null
                    //     ? AppColors.primaryColor.withOpacity(0.15)
                    //     : AppColors.primaryColor.withOpacity(0.0),
                    minimumSize: const Size(30, 62),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            AppComponents.defaultBorderRadius))),
                child: Text(buttonText,
                    textAlign: TextAlign.center,
                    style: onTap == null
                        ? AppTextStyles.semiSmallXBoldTextStyle
                            .copyWith(color: AppColors.buttonGreyColor)
                        : null)),
          ),
        ),
      ],
    );
  }
}

/// Custom TextButton widget which is very tight to child text
class CustomTightTextButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CustomTightTextButtonWidget({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity)),
        child: child);
  }
}

class BottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BottomSheetAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: AppColors.primaryColor,
              )),
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(title,
                style: AppTextStyles.titlesemiSmallMediumTextStyle.copyWith(
                  color: AppColors.primaryColor,
                )),
          ),
        ),
        Divider(
          color: AppColors.dottedColor,
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  final Color backgroundColor;
  final Color titleColor;
  final Color backButtonColor;
  final Color dividerColor;
  final double dividerThickness;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.hasBackButton = true,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.backButtonColor = Colors.black,
    this.dividerColor = AppColors.dottedColor,
    this.dividerThickness = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: hasBackButton
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPictureAssetWidget(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: AppColors.primaryTextColor,
                  ))
              : null,
          centerTitle: true,
          title: Text(title,
              style: AppTextStyles.notificationSemiBoldDateSection.copyWith(
                color: AppColors.primaryTextColor,
              )),
        ),
        Divider(
          color: dividerColor,
          thickness: dividerThickness,
          height: 0,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class SelectImageButton extends StatelessWidget {
  final void Function()? onTap;
  const SelectImageButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RawButtonWidget(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssetImages.imagePlaceholderIconImage,
                    height: 102.47,
                    width: 102.47,
                  ),
                ]),
          ),
        ));
  }
}
