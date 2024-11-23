import 'package:flutter/material.dart';

/// This file contains various components for the app
class AppComponents {
  static const defaultBorderRadius = Radius.circular(4);
  static const double defaultBorderRadiusValue = 8;
  static const double dialogBorderRadiusValue = 8;
  static const defaultBorder =
      BorderRadius.all(Radius.circular(AppComponents.defaultBorderRadiusValue));
  static const EdgeInsets dialogTitlePadding = EdgeInsets.fromLTRB(
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogVerticalSpaceValue,
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogVerticalSpaceValue);
  static const EdgeInsets dialogContentPadding = EdgeInsets.fromLTRB(
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogHalfVerticalSpaceValue,
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogVerticalSpaceValue);
  static const EdgeInsets dialogActionPadding = EdgeInsets.fromLTRB(
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogVerticalSpaceValue,
      AppComponents.dialogHorizontalSpaceValue,
      AppComponents.dialogVerticalSpaceValue);
  static const BorderRadius dialogBorderRadius =
      BorderRadius.all(Radius.circular(AppComponents.dialogBorderRadiusValue));
  /*<--------Dialog padding values------->*/
  static const double dialogVerticalSpaceValue = 16;
  static const double dialogHalfVerticalSpaceValue = 8;
  static const double dialogHorizontalSpaceValue = 18;
  static const double imageBorderRadiusValue = 14;
  static const double smallBorderRadiusValue = 5;
  static const double auctionGridItemBorderRadiusValue = 20;
  static const double uploadImageButtonBorderRadiusValue = 12;
}
