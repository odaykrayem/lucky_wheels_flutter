// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/constants/app_constants.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';
import '../models/user_model.dart';
import '../utils/cacheHelper.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthController({
    required this.authRepo,
  });

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      try {
        // debugPrint('${response.body['data']['token']}');
        authRepo.saveUserToken(response.body['data']['token']);
        debugPrint('${authRepo.getUserToken()}');
        UserModel userModel = UserModel.fromJson(response.body['data']);

        debugPrint('user :' + userModel.toString());
        CacheHelper.saveData(
            key: AppConstants.USER_DATA_KEY,
            value: jsonEncode(userModel.toJson()));
        UserModel user2 = UserModel.fromJson(
            jsonDecode(CacheHelper.getData(key: AppConstants.USER_DATA_KEY)));
        debugPrint('userAfter :  ${user2.toJson()}');
        responseModel = ResponseModel(true, response.body['data']['token']);
      } catch (e) {
        responseModel = ResponseModel(false, e.toString());
        _isLoading = false;
        update();
      }
    } else {
      responseModel =
          ResponseModel(false, '${(response.body['errors'])[0]['message']}');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String phone, String password) async {
    debugPrint('auth con: ${await authRepo.getUserToken()}');
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      try {
        authRepo.saveUserToken(response.body['data']['token']);
        debugPrint('${authRepo.getUserToken()}');
        UserModel userModel = UserModel.fromJson(response.body['data']);

        debugPrint('user :' + userModel.toString());
        CacheHelper.saveData(
            key: AppConstants.USER_DATA_KEY,
            value: jsonEncode(userModel.toJson()));
        UserModel user2 = UserModel.fromJson(
            jsonDecode(CacheHelper.getData(key: AppConstants.USER_DATA_KEY)));
        debugPrint('userAfter :  ${user2.toJson()}');
        // responseModel = ResponseModel(true, response.body['data']['token']);
        responseModel = ResponseModel(true, 'loginSuccessfully'.tr);
      } catch (e) {
        responseModel = ResponseModel(false, 'catche error');
      }
    } else {
      debugPrint('auth else : ${response.bodyBytes}');
      debugPrint('auth else : ${response.body}');
      debugPrint('auth else : ${response.statusCode}');
      debugPrint('auth else : ${response.statusText}');
      try {
        if (response.body['errors'] != null) {
          responseModel = ResponseModel(
              false, '${(response.body['errors'])[0]['message']}');
        } else {
          responseModel = ResponseModel(false, 'error');
        }
      } catch (e) {
        e.printError();
        responseModel = ResponseModel(false, 'No Connection');
      }
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  // //BY ME
  // Future<String> getUserToken() async {
  //   return await authRepo.getUserToken();
  // }
}
