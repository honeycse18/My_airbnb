import 'package:airbnb_app/utils/parse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/constant.dart';

class ResponseData {
  final int statusCode;
  final String msg;
  final dynamic data;

  ResponseData({
    required this.msg,
    required this.data,
    required this.statusCode,
  });
}

class ApiRequest {
  static const String _baseUrl = AppConstants.apiUrl;
  static const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));

  static Future<String?> get getToken async {
    try {
      return await storage.read(key: 'token');
    } catch (e) {
      await storage.deleteAll();
      if (kDebugMode) {
        print(e);
      }
      return '';
    }
  }

    static final Dio _dio = Dio(
      BaseOptions(
        baseUrl: '$_baseUrl/api/v1',
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 600,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    static Future<ResponseData> get(
    String url, Map<String, dynamic>? params) async {
      try {
        String? token = await getToken;
        var response = await _dio.get(
          url,
          queryParameters: params,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: safeStringParse(response.data["message"]),
          data: response.data["data"],
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return ResponseData(
          msg: 'Something went wrong',
          data: null,
          statusCode: 500,
        );
      }
    }

    static Future<ResponseData> getURLEncoded(
    String url, Map<String, dynamic>? params) async {
      try {
        String? token = await getToken;
        var response = await _dio.get(
          url,
          queryParameters: params,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
            contentType: 'application/x-www-form-urlencoded',
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: response.data["message"] ?? "",
          data: response.data["data"],
        );
      } catch (e) {
        return ResponseData(
          msg: 'Something went wrong',
          data: null,
          statusCode: 500,
        );
      }
    }

    static Future<ResponseData> post(
    String url, Map<String, dynamic>? data) async {
      try {
        String? token = await getToken;
        var response = await _dio.post(
          url,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: safeStringParse(response.data["message"]),
          data: response.data["data"],
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return ResponseData(
          msg: e.toString(),
          data: null,
          statusCode: 500,
        );
      }
    }

    static Future<ResponseData> postURLEncoded(
    String url, Map<String, dynamic>? data) async {
      try {
        String? token = await getToken;
        var response = await _dio.post(
          url,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
            contentType: 'application/x-www-form-urlencoded',
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: response.data["message"] ?? "",
          data: response.data["data"],
        );
      } catch (e) {
        return ResponseData(
          msg: e.toString(),
          data: null,
          statusCode: 500,
        );
      }
    }

    static Future<ResponseData> put(
    String url, Map<String, dynamic>? data) async {
      try {
        String? token = await getToken;
        var response = await _dio.put(
          url,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: response.data["message"] ?? "",
          data: response.data["data"],
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return ResponseData(
          msg: 'Something went wrong',
          data: null,
          statusCode: 500,
        );
      }
    }

    static Future<ResponseData> patch(
    String url, Map<String, dynamic>? data) async {
      try {
        String? token = await getToken;
        var response = await _dio.patch(
          url,
          data: data,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        );
        return ResponseData(
          statusCode: response.statusCode ?? 404,
          msg: response.data["message"] ?? "",
          data: response.data["data"],
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return ResponseData(
          msg: 'Something went wrong',
          data: null,
          statusCode: 500,
        );
      }
    }
  }
