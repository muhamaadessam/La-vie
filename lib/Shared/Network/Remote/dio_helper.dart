import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: url,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {@required String? endPoint,
      @required String? method,
      @required Map<String, dynamic>? query}) async {
    return await dio!.get(
      '$endPoint$method',
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? endPoint,
    @required String? method,
    @required dynamic data,
    String? accessToken,
  }) async {
    dio!.options.headers = {
      "Content-type": "application/json",
      'accessToken': accessToken,
    };

    return await dio!.post(
      '$url$endPoint$method',
      data: data,
    );
  }
}
