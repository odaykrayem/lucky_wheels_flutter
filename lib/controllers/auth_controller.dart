// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';

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
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
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
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
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

  // //BY ME
  // Future<String> getUserToken() async {
  //   return await authRepo.getUserToken();
  // }
}
