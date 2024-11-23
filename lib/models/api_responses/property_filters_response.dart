import 'package:airbnb_app/utils/utils.dart';

class CategoryFiltersResponse {
  bool error;
  String msg;
  List<CategoryFilterTabItems> data;

  CategoryFiltersResponse(
      {this.error = false, this.msg = '', this.data = const []});

  factory CategoryFiltersResponse.fromJson(Map<String, dynamic> json) {
    return CategoryFiltersResponse(
      error: AppUtils.isBool(json['error']),
      msg: AppUtils.getSafeString(json['msg']),
      data: AppUtils.getSafeList(json['data'])
          .map((e) => CategoryFilterTabItems.getAPIResponseObjectSafeValue(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => e.toJson()).toList(),
      };

  static CategoryFiltersResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      AppUtils.isSafeMapObject(unsafeResponseValue)
          ? CategoryFiltersResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : CategoryFiltersResponse();
}

class CategoryFilterTabItems {
  int count;
  String slug;
  String name;
  String icon;
  bool filter;

  CategoryFilterTabItems(
      {this.count = 0,
      this.slug = '',
      this.name = '',
      this.icon = '',
      this.filter = false});

  factory CategoryFilterTabItems.fromJson(Map<String, dynamic> json) =>
      CategoryFilterTabItems(
        count: AppUtils.getSafeInt(json['count']),
        slug: AppUtils.getSafeString(json['slug']),
        name: AppUtils.getSafeString(json['name']),
        icon: AppUtils.getSafeString(json['icon']),
        filter: AppUtils.getSafeBool(json['filter']),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'slug': slug,
        'name': name,
        'icon': icon,
        'filter': filter,
      };

  static CategoryFilterTabItems getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      AppUtils.isSafeMapObject(unsafeResponseValue)
          ? CategoryFilterTabItems.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : CategoryFilterTabItems();
}
