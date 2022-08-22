import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:la_vie/Shared/Network/Remote/constant.dart';

import '../Local/cash_helper.dart';

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
      {required String? endPoint,
      required String? method,
      String? refreshToken,
      Map<String, dynamic>? query}) async {
    dio!.options.headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer ${CashHelper.get(key: 'accessToken')}',
    };
    return await dio!.get(
      '$endPoint$method',
      queryParameters: query,
    );
  }

  static Future<Response> patchData({
    required String? endPoint,
    required String? method,
    required dynamic data,
  }) async {
    dio!.options.headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer ${CashHelper.get(key: 'accessToken')}',
    };
    return await dio!.patch(
      '$endPoint$method',
      data: data,
    );
  }

  static Future<Response> postData({
    @required String? endPoint,
    @required String? method,
    @required dynamic data,
  }) async {
    dio!.options.headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer ${CashHelper.get(key: 'accessToken')}',
    };

    return await dio!.post(
      '$url$endPoint$method',
      data: data,
    );
  }
}
