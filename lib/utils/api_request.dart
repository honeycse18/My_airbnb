import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/constant.dart';

class ResponseData {
  final bool error;
  final String msg;
  final dynamic data;
  final String? token;
  final String? refreshToken;

  ResponseData({
    required this.error,
    required this.msg,
    required this.data,
    this.token,
    this.refreshToken,
  });
}

class ApiRequest {
  static const String _baseUrl = AppConstants.apiUrl;
  static const storage = FlutterSecureStorage();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '$_baseUrl/api',
      receiveDataWhenStatusError: true,
      validateStatus: (status) => status! < 600,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  static Future<ResponseData> get(
      String url, Map<String, dynamic>? params) async {
    try {
      String? token = await storage.read(key: 'token');
      print(url);
      var response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: {"Authorization": "Authorization $token"},
        ),
      );
      return ResponseData(
        error: response.data["error"] ?? true,
        msg: response.data["msg"] ?? "",
        data: response.data["data"],
      );
    } catch (e) {
      print(e);
      return ResponseData(
        error: true,
        msg: 'Something went wrong',
        data: null,
      );
    }
  }

  static Future<ResponseData> getURLEncoded(
      String url, Map<String, dynamic>? params) async {
    try {
      String? token = await storage.read(key: 'token');
      var response = await _dio.get(
        url,
        queryParameters: params,
        options: Options(
          headers: {"Authorization": "Authorization $token"},
          contentType: 'application/x-www-form-urlencoded',
        ),
      );
      return ResponseData(
        error: response.data["error"] ?? true,
        msg: response.data["msg"] ?? "",
        data: response.data["data"],
      );
    } catch (e) {
      return ResponseData(
        error: true,
        msg: 'Something went wrong',
        data: null,
      );
    }
  }

  static Future<ResponseData> post(
      String url, Map<String, dynamic>? data) async {
    try {
      String? token = await storage.read(key: 'token');
      var response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Authorization $token"},
        ),
      );
      return ResponseData(
        error: response.data["error"] ?? true,
        msg: response.data["msg"] ?? "",
        data: response.data["data"],
        token: response.data["token"],
        refreshToken: response.data["refresh_token"],
      );
    } catch (e) {
      return ResponseData(
        error: true,
        msg: e.toString(),
        data: null,
      );
    }
  }

  static Future<ResponseData> postURLEncoded(
      String url, Map<String, dynamic>? data) async {
    try {
      String? token = await storage.read(key: 'token');
      var response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Authorization $token"},
          contentType: 'application/x-www-form-urlencoded',
        ),
      );
      return ResponseData(
        error: response.data["error"] ?? true,
        msg: response.data["msg"] ?? "",
        data: response.data["data"],
        token: response.data["token"],
        refreshToken: response.data["refresh_token"],
      );
    } catch (e) {
      return ResponseData(
        error: true,
        msg: e.toString(),
        data: null,
      );
    }
  }

  static Future<ResponseData> put(
      String url, Map<String, dynamic>? data) async {
    try {
      String? token = await storage.read(key: 'token');
      var response = await _dio.put(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Authorization $token"},
        ),
      );
      return ResponseData(
        error: response.data["error"] ?? true,
        msg: response.data["msg"] ?? "",
        data: response.data["data"],
        token: response.data["token"],
      );
    } catch (e) {
      print(e);
      return ResponseData(
        error: true,
        msg: 'Something went wrong',
        data: null,
      );
    }
  }
}
