import 'package:airbnb_app/utils/extensions/int.dart';

extension DurationToHumanReadableTime on Duration {
  int get toHumanReadableSeconds =>
      inSeconds.remainder(Duration.secondsPerMinute);
  String get toHumanReadableSecondsText =>
      toHumanReadableSeconds.toInt().to2Digits;

  int get toHumanReadableMinutes =>
      inMinutes.remainder(Duration.minutesPerHour);
  String get toHumanReadableMinutesText =>
      toHumanReadableMinutes.toInt().to2Digits;

  int get toHumanReadableHours => inHours.remainder(Duration.hoursPerDay);
  String get toHumanReadableHoursText => toHumanReadableHours.toInt().to2Digits;
}
