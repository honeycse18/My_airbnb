import 'dart:ui';

import 'package:airbnb_app/utils/helpers.dart';
import 'package:flutter/material.dart';

class AppColors {
  // Colors

  static const Color primaryColor = Color(0xFF000000);
  static const Color primaryTextColor = Color(0xFF373A40);
  static const Color languageButtonColor = Color(0xFFF3F3F4);
  static const Color profileContainerColor = Color(0xFFF0F0F0);
  static const Color buttonGreyColor = Color(0xFFB2B1B9);
  static const Color inputFieldBorderColor = Color(0xFFEEEEEE);
  static const Color secondaryTextColor = Color(0xFF7C8894);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color dividerColor = Color(0xFFC5C5C5);
  static const Color selectedButtonColor = Color(0xFFD90864);
  static const Color SecondaryButton = Color(0xFF1A2130);
  static const Color primary50Color = Color(0xFFFFF5ED);
  static const Color ContainerGreyColor = Color(0xFFE7E7E7);
  static const Color dotColor = Color(0xFFD9D9D9);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color dottedColor = Color(0xFFC5C5C5);
  static const Color iconColor = Color(0xFF1C274C);
  static const Color textColor = Color(0xFF555555);
  static const Color deactivateTextColor = Color(0xFFFF7979);
  static const Color customTextButtonColor = Color(0xFF00A3FF);

  static const Color containerBackColor = Color(0xFFF7F7F7);

  static const Color lineShapeColor = Color(0xFFEBEDF9);

  static const Color bodyTextColor = Color(0xFF404D64);
  static const Color shimmerBaseColor = AppColors.bodyTextColor;
  static const Color shimmerHighlightColor = AppColors.lineShapeColor;

  static final MaterialColor primaryMaterialColor =
      Helper.generateMaterialColor(AppColors.primaryColor);
  static const bool production = false;
  static const String apiUrl = production
      ? "https://api.beautick4you.com"
      : "https://backend.airbnb.appstick.com.bd";
}
