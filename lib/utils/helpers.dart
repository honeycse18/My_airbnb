import 'dart:math';
import 'dart:typed_data';

import 'package:airbnb_app/utils/image_picker_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

double getAvailableHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom -
      MediaQuery.of(context).viewInsets.bottom;
}

class Helper {
  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: _generateTintColor(color, 0.9),
      100: _generateTintColor(color, 0.8),
      200: _generateTintColor(color, 0.6),
      300: _generateTintColor(color, 0.4),
      400: _generateTintColor(color, 0.2),
      500: color,
      600: _generateShadeColor(color, 0.1),
      700: _generateShadeColor(color, 0.2),
      800: _generateShadeColor(color, 0.3),
      900: _generateShadeColor(color, 0.4),
    });
  }

  static int _generateTintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color _generateTintColor(Color color, double factor) => Color.fromRGBO(
      _generateTintValue(color.red, factor),
      _generateTintValue(color.green, factor),
      _generateTintValue(color.blue, factor),
      1);

  static int _generateShadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _generateShadeColor(Color color, double factor) =>
      Color.fromRGBO(
          _generateShadeValue(color.red, factor),
          _generateShadeValue(color.green, factor),
          _generateShadeValue(color.blue, factor),
          1);

  static String? textFormValidator(String? text) {
    if (text != null) {
      if (text.isEmpty) return 'Can not be empty';
      if (text.length < 3) return 'Minimum length 3';
    }
    return null;
  }

  static String? emailFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isEmail(text)) {
        return 'Invalid email format';
      }
      return null;
    }
    return null;
  }

  static String? passwordFormValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    } else if (text.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'(?=.*?[A-Z])').hasMatch(text)) {
      return 'Password must include at least 1 uppercase letter';
    } else if (!RegExp(r'(?=.*?[a-z])').hasMatch(text)) {
      return 'Password must include at least 1 lowercase letter';
    } else if (!RegExp(r'(?=.*?[0-9])').hasMatch(text)) {
      return 'Password must include at least 1 number';
    } else if (!RegExp(r'(?=.*?[!@#$%^&*])').hasMatch(text)) {
      return 'Password must include at least 1 special character (!@#\$%^&*)';
    }
    return null;
  }

  static String? loginPasswordFormValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? phoneFormValidator(String? text) {
    if (text != null) {
      if (!GetUtils.isPhoneNumber(text)) {
        return 'Invalid phone number format';
      }
      return null;
    }
    return null;
  }

  static void pickImages(
      {String imageName = '',
      required void Function(List<Uint8List>, Map<String, dynamic>)
          onSuccessUploadSingleImage,
      Map<String, dynamic> additionalData = const {},
      String token = ''}) async {
    final List<image_picker.XFile>? pickedImages =
        await ImagePickerHelper.getPhoneImages();
    if (pickedImages == null || pickedImages.isEmpty) {
      return;
    }
    processPickedImages(pickedImages,
        onSuccessUploadSingleImage: onSuccessUploadSingleImage,
        imageName: imageName,
        additionalData: additionalData,
        token: token);
  }

  static void processPickedImages(List<image_picker.XFile> pickedImages,
      {required void Function(List<Uint8List>, Map<String, dynamic>)
          onSuccessUploadSingleImage,
      required String imageName,
      required Map<String, dynamic> additionalData,
      required String token}) async {
    List<Uint8List>? processedImages =
        await ImagePickerHelper.getProcessedImages(pickedImages);
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
