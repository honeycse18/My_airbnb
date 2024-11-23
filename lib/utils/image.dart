import 'dart:io';
import 'package:airbnb_app/constants/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class ImageHelper {
  static const String fallBackDoctorImage = '';
  static const storage = FlutterSecureStorage(aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  static Future<String> uploadImage(File image) async {
    try {
      Dio dio = Dio();
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path, filename: fileName)
      });
      String? token = await storage.read(key: 'token');
      Response response = await dio.post(
        "${AppConstants.apiUrl}/api/v1/attachments/upload-image",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Authorization $token"
          },
        ),
      );
      if (response.data['message'] == 'Success') {
        return response.data['data']['url'];
      } else {
        return '';
      }
    } catch (e) {
      if (e.runtimeType == DioError) {
      } else {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      return '';
    }
  }
}


