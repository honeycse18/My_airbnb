import 'dart:ui';

import 'package:airbnb_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static const String appName = "AirBnB";
  static const String welcomeText = "Appstick home";
  static const String letsPlanYourTrip = "Lets plan your trip!";
  static const String whereWantToGo = "Where want to go";

  static const String whatYouNeed = "What You Need?";
  static const String seeAll = "See All";
  static const String bookByMap = "Book By Map";
  static const String bestVisitedPlace = "Best Visited Place";
  static const String bestCityForYou = "Best City For You!";
  static const String defaultCurrencyFormat = '#,##0.00 \u00A4';
  static final apiDateTimeFormat =
      DateFormat('yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'');
  static const int unsetDateTimeYear = 1800;
  static final DateTime unsetDateTime = DateTime(unsetDateTimeYear);

  //static const String  = "";
  //static const String  = "";
  static const String omg = 'OMG';
  static const String beach = 'Beach';
  static const String amazingPool = 'Amazing pools';
  static const String islands = 'Islands';
  static const String arctic = 'Arctic';
  static const String rooms = 'Rooms';
  static const String amazingViews = 'Amazing views';
  static const String beachfront = 'Beachfront';
  static const String caves = 'Caves';

  static const String unknown = 'unknown';
  // Colors
  static final NumberFormat dollarNumberFormat = NumberFormat.currency(
      symbol: '\$', customPattern: AppConstants.defaultCurrencyFormat);
  static final NumberFormat dollarNoDecimalNumberFormat = NumberFormat.currency(
      symbol: '\$',
      customPattern: AppConstants.defaultCurrencyFormat,
      decimalDigits: 0);

  static const bool production = false;
  static const String apiUrl = production
      ? "https://api.beautick4you.com"
      : "https://backend.airbnb.appstick.com.bd";
}
