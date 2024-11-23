

import 'package:airbnb_app/utils/utils.dart';

class PropertyFindResponse {
  bool error;
  String msg;
  List<PropertyItems> data;

  PropertyFindResponse(
      {this.error = false, this.msg = '', this.data = const []});

  factory PropertyFindResponse.fromJson(Map<String, dynamic> json) {
    return PropertyFindResponse(
      error: AppUtils.getSafeBool(json['error']),
      msg: AppUtils.getSafeString(json['msg']),
      data: AppUtils.getSafeList(json['data'])
          .map((e) => PropertyItems.getAPIResponseObjectSafeValue(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => e.toJson()).toList(),
      };

  static PropertyFindResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
    AppUtils.isSafeMapObject(unsafeResponseValue)
          ? PropertyFindResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : PropertyFindResponse();
}

class PropertyItems {
  String id;
  String uid;
  String title;
  double price;
  Location location;
  List<String> images;

  PropertyItems({
    this.id = '',
    this.uid = '',
    this.title = '',
    this.price = 0,
    required this.location,
    this.images = const [],
  });

  factory PropertyItems.fromJson(Map<String, dynamic> json) => PropertyItems(
        id: AppUtils.getSafeString(json['_id']),
        uid: AppUtils.getSafeString(json['uid']),
        title: AppUtils.getSafeString(json['title']),
        price: AppUtils.getSafeDouble(json['price']),
        location: Location.getAPIResponseObjectSafeValue(json['location']),
        images: AppUtils.getSafeList(json['images'])
            .map((e) => AppUtils.getSafeString(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'uid': uid,
        'title': title,
        'price': price,
        'location': location.toJson(),
        'images': images,
      };

  factory PropertyItems.empty() => PropertyItems(location: Location());
  static PropertyItems getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      AppUtils.isSafeMapObject(unsafeResponseValue)
          ? PropertyItems.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : PropertyItems.empty();
}

class Location {
  String name;
  double lat;
  double lng;
  String city;
  String country;
  String countryLong;

  Location({
    this.name = '',
    this.lat = 0,
    this.lng = 0,
    this.city = '',
    this.country = '',
    this.countryLong = '',
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: AppUtils.getSafeString(json['name']),
        lat: AppUtils.getSafeDouble(json['lat']),
        lng: AppUtils.getSafeDouble(json['lng']),
        city: AppUtils.getSafeString(json['city']),
        country: AppUtils.getSafeString(json['country']),
        countryLong: AppUtils.getSafeString(json['country_long']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lat': lat,
        'lng': lng,
        'city': city,
        'country': country,
        'country_long': countryLong,
      };

  static Location getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      AppUtils.isSafeMapObject(unsafeResponseValue)
          ? Location.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Location();
}
