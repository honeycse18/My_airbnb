import 'package:airbnb_app/constants/components.dart';
import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constant.dart';

ThemeData appTheme(brightness) {
  var baseTheme = ThemeData(
    useMaterial3: false,
    brightness: brightness,
    fontFamily: 'Zilla Slab',
    primarySwatch: AppColors.primaryMaterialColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontSize: 26,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 24,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          fontSize: 20,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.bold),
      labelLarge: TextStyle(
          fontSize: 18,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 14,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w500),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.transparent,

        //filled: true,
        hintStyle: TextStyle(color: AppColors.secondaryTextColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(AppComponents.defaultBorderRadius),
            borderSide:
                BorderSide(color: AppColors.inputFieldBorderColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(AppComponents.defaultBorderRadius),
            borderSide:
                BorderSide(color: AppColors.inputFieldBorderColor, width: 1))),
    /*<--------Set default appbar theme------->*/
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 28,
          fontFamily: 'Geist',
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w700),
    ),
  );

  return baseTheme.copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
