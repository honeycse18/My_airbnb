import 'package:flutter/material.dart';

String safeStringParse(dynamic value) {
  try {
    if (value == null) {
      return '';
    }
    return value.toString();
  } catch (e) {
    return '';
  }
}

int safeIntParse(dynamic value) {
  try {
    if (value == null) {
      return 0;
    }
    return int.parse(value.toString());
  } catch (e) {
    return 0;
  }
}

double safeDoubleParse(dynamic value) {
  try {
    if (value == null) {
      return 0.0;
    }
    return double.parse(value.toString());
  } catch (e) {
    return 0.0;
  }

}

bool safeBoolParse(dynamic value) {
  try {
    if (value == null) {
      return false;
    }
    return value.toString().toLowerCase() == 'true';
  } catch (e) {
    return false;
  }
}

DateTime safeDateTimeParse(dynamic value) {
  try {
    if (value == null) {
      return DateTime.now();
    }
    return DateTime.parse(value.toString());
  } catch (e) {
    return DateTime.now();
  }
}


safeListParse(dynamic value) {
  try {
    if (value == null) {
      return [];
    }
    if(value is List) {
      return value;
    }
    return [];
  } catch (e) {
    return [];
  }
}

stringToColor(String value, {Color defaultColor = Colors.black}) {
  try {
    if(value.isEmpty) {
      return defaultColor;
    }
    return Color(safeIntParse(value.replaceAll('#', '0xFF')));
  } catch (e) {
    return defaultColor;
  }
}