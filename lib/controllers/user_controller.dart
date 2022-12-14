// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../data/repository/user_repo.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  bool _isLoading = false;
  // late UserModel? _userModel;
  UserModel? _userModel;

  bool get isLoading => _isLoading;
  UserModel? get userModel => _userModel;

  UserController({
    required this.userRepo,
  });

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    // debugPrint('userCon: ${response.body}');

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      debugPrint('userCon: getInfo success');
      responseModel = ResponseModel(true, 'Successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('userCon: getInfo failed');
    }
    update();
    return responseModel;
  }
}
