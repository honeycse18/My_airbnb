import 'dart:io';

// import 'package:appinio_social_share/appinio_social_share.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:encrypt/encrypt.dart';
import 'package:airbnb_app/constants/constant.dart';
import 'package:airbnb_app/utils/extensions/datetime.dart';
import 'package:airbnb_app/widgets/common/alert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class    AppUtils {
  static String formatCard(String s) {
    String card = s.replaceAll(RegExp(r"\D"), "");
    if (card.length > 16) {
      card = card.substring(0, 16);
    }

    List<String> groups = card.split('').fold<List<String>>(<String>[''],
        (List<String> acc, String digit) {
      if (acc.last.length == 4) {
        acc.add('');
      }
      acc.last += digit;
      return acc;
    });
    return groups.join('-');
  }

  /// Return default currency formatted text as string. Example: 45000 will
  /// return as 45,000 $
  static String formatDollarCurrentAmount(double amount,
          {bool showDecimal = true}) =>
      showDecimal
          ? AppConstants.dollarNumberFormat.format(amount)
          : AppConstants.dollarNoDecimalNumberFormat.format(amount);



  static bool get isCurrentLanguageRTL {
    try {
      return Bidi.isRtlLanguage(Get.locale?.languageCode);
    } catch (e) {
      return false;
    }
  }

  static String getSafeString(dynamic unsafeResponseStringValue) {
    const String defaultStringValue = '';
    if (unsafeResponseStringValue == null) {
      return defaultStringValue;
    } else if (unsafeResponseStringValue is String) {
      // Now it is safe
      return unsafeResponseStringValue;
    }
    return defaultStringValue;
  }

  static List<T> getSafeList<T>(dynamic unsafeResponseListValue) {
    const List<T> defaultListValue = [];
    if (unsafeResponseListValue == null) {
      return defaultListValue;
    } else if (unsafeResponseListValue is List<T>) {
      // Now it is safe
      return unsafeResponseListValue;
    }
    return defaultListValue;
  }

  static DateTime getSafeDateTime(
    dynamic unsafeResponseDateTimeStringValue, {
    String dateTimeFormat = '',
    bool isUTCTime = true,
  }) {
    final String safeDateTimeStringValue =
        getSafeString(unsafeResponseDateTimeStringValue);
    return getSafeDateTimeFromString(safeDateTimeStringValue,
        dateTimeFormat: dateTimeFormat, isUTCTime: isUTCTime);
  }

  static int getSafeInt(dynamic unsafeResponseIntValue,
      [int defaultIntValue = 0]) {
    if (unsafeResponseIntValue == null) {
      return defaultIntValue;
    } else if (unsafeResponseIntValue is String) {
      return (num.tryParse(unsafeResponseIntValue) ?? defaultIntValue).toInt();
    } else if (unsafeResponseIntValue is num) {
      // Now it is safe
      return unsafeResponseIntValue.toInt();
    }
    return defaultIntValue;
  }

  static double getSafeDouble(dynamic unsafeResponseDoubleValue,
      [double defaultDoubleValue = 0]) {
    if (unsafeResponseDoubleValue == null) {
      return defaultDoubleValue;
    } else if (unsafeResponseDoubleValue is String) {
      return (num.tryParse(unsafeResponseDoubleValue) ?? defaultDoubleValue)
          .toDouble();
    } else if (unsafeResponseDoubleValue is num) {
      // Now it is safe
      return unsafeResponseDoubleValue.toDouble();
    }
    return defaultDoubleValue;
  }

  static bool isBool(dynamic boolAsString) {
    if (boolAsString is! String) {
      return false;
    }
    if (boolAsString == 'true') {
      return true;
    } else if (boolAsString == 'false') {
      return true;
    }
    return false;
  }

  static bool? getBoolFromString(String boolAsString) {
    if (boolAsString == 'true') {
      return true;
    } else if (boolAsString == 'false') {
      return false;
    }
    return null;
  }

  static bool getSafeBool(dynamic unsafeResponseBoolValue,
      [bool defaultBoolValue = false]) {
    if (unsafeResponseBoolValue == null) {
      return defaultBoolValue;
    } else if (unsafeResponseBoolValue is String) {
      if (isBool(unsafeResponseBoolValue)) {
        return getBoolFromString(unsafeResponseBoolValue) ?? defaultBoolValue;
      }
      return defaultBoolValue;
    } else if (unsafeResponseBoolValue is bool) {
      // Now it is safe
      return unsafeResponseBoolValue;
    }
    return defaultBoolValue;
  }

  static DateTime getSafeDateTimeFromString(
    String dateTimeAsString, {
    String dateTimeFormat = '',
    bool isUTCTime = true,
  }) {
    try {
      if (dateTimeFormat.isNotEmpty) {
        return DateFormat(dateTimeFormat)
            .parse(dateTimeAsString, isUTCTime)
            .toLocal();
      }
      return AppConstants.apiDateTimeFormat
          .parse(dateTimeAsString, isUTCTime)
          .toLocal();
    } catch (e) {
      return AppConstants.unsetDateTime;
    }
  }

  static String getStringFromDateTime(DateTime dateTime,
      {String dateTimeFormat = '', bool toUTCTime = true}) {
    final correctDateTime =
        switch (toUTCTime) { true => dateTime.toUtc(), false => dateTime };
    if (dateTimeFormat.isNotEmpty) {
      return correctDateTime.formatted(dateTimeFormat);
    }
    return AppConstants.apiDateTimeFormat.format(correctDateTime);
  }

  static bool isSafeMapObject(dynamic unsafeValue) {
    if (unsafeValue is Map<String, dynamic>) {
      // Now it is safe
      return true;
    }
    return false;
  }

  static bool isTextIsCardNumberWithDashes(String text) =>
      RegExp(r'^(\d{4}-){3}\d{4}$').hasMatch(text);

  static bool isTextIsCardNumberWithSpaces(String text) =>
      RegExp(r'^(\d{4} ){3}\d{4}$').hasMatch(text);

  static bool isTextIsCardNumberWithNoDelimiter(String text) =>
      RegExp(r'^\d{16}$').hasMatch(text);

  static bool isTextIsBarcodeNumber(String text) =>
      RegExp(r'^\d{8}$').hasMatch(text);

  static bool isTextIsCardNumber(String text) =>
      isTextIsCardNumberWithDashes(text) ||
      isTextIsCardNumberWithSpaces(text) ||
      isTextIsCardNumberWithNoDelimiter(text);

  static String removeCardDelimiterCharacters(String cardNumber) {
    String card = cardNumber;
    card = card.trim();
    card = card.replaceAll(' ', '');
    card = card.replaceAll('-', '');
    return card;
  }

  static String formatCardNumber(String cardNumber,
      {String delimeterCharacter = ''}) {
    try {
      cardNumber = removeCardDelimiterCharacters(cardNumber);
      if (isTextIsCardNumberWithNoDelimiter(cardNumber) == false) {
        return '';
      }
      StringBuffer newText = StringBuffer();
      for (int i = 0; i < cardNumber.length; i++) {
        if (i % 4 == 0 && i != 0) {
          newText.write(delimeterCharacter);
        }
        newText.write(cardNumber[i]);
      }
      return newText.toString();
    } catch (e) {
      return cardNumber;
    }
  }





  static String getCurrentLocaleString() =>
      '${Get.locale?.languageCode}_${Get.locale?.countryCode}';

  static String getFullName(
      {required String firstName, required String lastName}) {
    StringBuffer fullNameBuffer = StringBuffer();
    if (firstName.isEmpty && lastName.isEmpty) {
      return fullNameBuffer.toString();
    }
    if (firstName.isEmpty && lastName.isNotEmpty) {
      fullNameBuffer.write(lastName);
      return fullNameBuffer.toString();
    }
    if (firstName.isNotEmpty && lastName.isEmpty) {
      fullNameBuffer.write(firstName);
      return fullNameBuffer.toString();
    }
    fullNameBuffer.write(firstName);
    fullNameBuffer.write(' ');
    fullNameBuffer.write(lastName);
    return fullNameBuffer.toString();
  }


 

  

  
}
