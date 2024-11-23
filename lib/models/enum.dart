import 'package:airbnb_app/constants/constant.dart';

enum LanguageTabState {
  English,
  Arabic,
}

enum languageSelectedTabStateStatus {
  step1,
  step2,
}

enum languageSelectedDetailsTabState { incomplete, completed }

enum homeTabState {
  OMG,
  Beach,
  AmazingPools,
  Islands,
  Arctic,
  Rooms,
  AmazingViews,
  Beachfront,
  Caves,
}

enum homeSelectedTabStateStatus {
  step1,
  step2,
  step3,
  step4,
  step5,
  step6,
  step7,
  step8,
  step9,
}

enum HomeTabStatus {
  omg(AppConstants.omg, 'OMG'),
  beach(AppConstants.beach, 'Beach'),
  amazingPool(AppConstants.amazingPool, 'Amazing pools'),
  islands(AppConstants.islands, 'Islands'),
  arctic(AppConstants.arctic, 'Arctic'),
  rooms(AppConstants.rooms, 'Rooms'),
  amazingViews(AppConstants.amazingViews, 'Amazing views'),
  beachfront(AppConstants.beachfront, 'Beachfront'),
  caves(AppConstants.caves, 'Caves'),
  unknown(AppConstants.unknown, 'Unknown');

  final String stringValue;
  final String stringValueForView;
  const HomeTabStatus(this.stringValue, this.stringValueForView);

  static HomeTabStatus toEnumValue(String value) {
    final Map<String, HomeTabStatus> stringToEnumMap = {
      HomeTabStatus.omg.stringValue: HomeTabStatus.omg,
      HomeTabStatus.beach.stringValue: HomeTabStatus.beach,
      HomeTabStatus.amazingPool.stringValue: HomeTabStatus.amazingPool,
      HomeTabStatus.islands.stringValue: HomeTabStatus.islands,
      HomeTabStatus.arctic.stringValue: HomeTabStatus.arctic,
      HomeTabStatus.rooms.stringValue: HomeTabStatus.rooms,
      HomeTabStatus.amazingViews.stringValue: HomeTabStatus.amazingViews,
      HomeTabStatus.beachfront.stringValue: HomeTabStatus.beachfront,
      HomeTabStatus.caves.stringValue: HomeTabStatus.caves,
      HomeTabStatus.unknown.stringValue: HomeTabStatus.unknown
    };
    return stringToEnumMap[value] ?? HomeTabStatus.unknown;
  }
}
