import 'package:airbnb_app/utils/utils.dart';

extension APIDateTime on String {
  DateTime toDateTimeForAPI({
    String dateTimeFormat = '',
    bool isUTCTime = true,
  }) =>
      AppUtils.getSafeDateTimeFromString(this,
          dateTimeFormat: dateTimeFormat, isUTCTime: isUTCTime);
}
