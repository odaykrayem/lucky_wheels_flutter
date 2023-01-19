// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/app_constants.dart';
import 'package:lucky_wheels_flutter/utils/cacheHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 20);
    // token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      // 'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      updateHeader(sharedPreferences.getString(AppConstants.TOKEN) ?? '');

      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    debugPrint('api Client:$body');
    updateHeader(sharedPreferences.getString(AppConstants.TOKEN) ?? '');

    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      debugPrint(response.toString());
      debugPrint('response :: ${response.bodyString}');

      return response;
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('${2}');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
