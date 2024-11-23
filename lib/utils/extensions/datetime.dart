import 'package:airbnb_app/utils/utils.dart';
import 'package:intl/intl.dart';

extension APIDateTime on DateTime {
  String formatted(String dateTimeFormat, {String? locale}) {
    try {
      return DateFormat(dateTimeFormat, locale).format(this);
    } catch (e) {
      return '';
    }
  }

  String toStringForAPI({
    String dateTimeFormat = '',
    bool toUTCTime = true,
  }) =>
      AppUtils.getStringFromDateTime(this,
          dateTimeFormat: dateTimeFormat, toUTCTime: toUTCTime);
}
