import 'package:intl/intl.dart';

String formatDate(DateTime date, String format) {
  try {
    return DateFormat(format).format(date);
  } catch (e) {
    return '';
  }
}


String formatIsTodayOrTomorrow(DateTime date) {
  try {
    DateTime now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day + 1) {
      return 'Tomorrow';
    } else {
      return formatDate(date, 'dd MMM');
    }
  } catch (e) {
    return '';
  }
}

String formatFromNowDays(DateTime date) {
  try {
    DateTime now = DateTime.now();
    Duration difference = date.difference(now);
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Tomorrow';
    } else {
      return 'in ${difference.inDays} days';
    }
  } catch (e) {
    return '';
  }
}


String minutesToHours(int minutes) {
  try {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    if (hours == 0) {
      return '$remainingMinutes min';
    }
    if (remainingMinutes == 0) {
      return '$hours h';
    }
    return '$hours h $remainingMinutes min';
  } catch (e) {
    return '';
  }
}


extension CurrencyFormat on int {
  String toCurrencyFormat() {
    try {
      return '€${toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ')}';
    } catch (e) {
      return '';
    }
  }

}


extension CurrencyFormat2 on double {
  String toCurrencyFormat() {
    try {
      return '€${toStringAsFixed(0).replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ')}';
    } catch (e) {
      return '';
    }
  }

}


extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    if(difference.inDays > 365){
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    if (difference.inDays > 30) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if (difference.inDays > 7) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays > 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays == 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours == 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes == 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds > 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}


