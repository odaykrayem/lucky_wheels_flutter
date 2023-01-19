// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/base/show_custom_snackbar.dart';
import 'package:lucky_wheels_flutter/constants/app_constants.dart';
import 'package:lucky_wheels_flutter/utils/cacheHelper.dart';

import '../data/repository/user_repo.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  bool _isLoading = false;
  bool _isDataLoaded = false;
  bool _isLoadingTransfer = false;
  // late UserModel? _userModel;
  UserModel? _userModel;
  late int _minPoints;
  late double _minBalance;
  late int _pointsToTransfer;
  late double _balanceToWithdraw;

  bool get isLoading => _isLoading;
  bool get isDataLoaded => _isDataLoaded;
  bool get isLoadingTransfer => _isLoadingTransfer;
  int get minPoints => _minPoints;
  double get minBalance => _minBalance;
  int get pointsToTransfer => _pointsToTransfer;
  double get balanceToWithdraw => _balanceToWithdraw;
  UserModel? get userModel => _userModel;

  void setIsLoading(bool isL) {
    _isLoading = isL;
  }

  UserController({
    required this.userRepo,
  });

  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    debugPrint('userCon: ${response.body}');

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body['data']);
      // _isLoading = false;
      debugPrint('userCon: getInfo success');
      responseModel = ResponseModel(true, 'Successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('userCon: getInfo failed');
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void getOfflineUserInfo() {
    _userModel = UserModel.fromJson(
        jsonDecode(CacheHelper.getData(key: AppConstants.USER_DATA_KEY)));
  }

  Future<ResponseModel> wheelPoints(points) async {
    _isLoading = true;
    update();
    Response response = await userRepo.wheelPoints(points);
    late ResponseModel responseModel;
    debugPrint('userWheelPoints: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('userCon: wheelPoints success');
      responseModel = ResponseModel(true, 'Successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('userCon: wheelPoints failed');
    }
    _isLoading = false;

    update();
    return responseModel;
  }

  Future<ResponseModel> getMinPoints() async {
    _isDataLoaded = false;
    Response response = await userRepo.getMinPoints();
    late ResponseModel responseModel;
    // debugPrint('userCon: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('userCon: getMinP success');
      responseModel = ResponseModel(true, 'Successfully');
      _minPoints = response.body['data']['value'];
      _pointsToTransfer = _minPoints;
      debugPrint('userCon: minPoints :$_minPoints');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('userCon: getMinP failed');
    }
    _isDataLoaded = true;

    update();
    return responseModel;
  }

  Future<ResponseModel> getMinBalance() async {
    _isDataLoaded = false;
    Response response = await userRepo.getMinBalance();
    late ResponseModel responseModel;
    // debugPrint('userCon: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('userCon: getMinB success');
      responseModel = ResponseModel(true, 'Successfully');
      _minBalance = double.parse('${response.body['data']['value']}');
      _balanceToWithdraw = _minBalance;
      debugPrint('userCon: minBalance :$_minBalance');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('userCon: getMinB failed');
    }
    _isDataLoaded = true;

    update();
    return responseModel;
  }

  Future<ResponseModel> transferPoints() async {
    _isLoadingTransfer = true;
    late ResponseModel responseModel;

    try {
      Response response = await userRepo.transferPoints(_pointsToTransfer);
      // debugPrint('userCon: ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('userCon: transferP success');
        responseModel = ResponseModel(true, 'Points Transferd Successfully');
        _pointsToTransfer = _minPoints;
        debugPrint('userCon: transferP :$_minPoints');
      } else {
        responseModel = ResponseModel(false, response.statusText!);
        debugPrint('userCon: transferP failed');
      }
    } catch (e) {
      _isLoadingTransfer = false;
      responseModel = ResponseModel(false, 'error');

      update();
    }
    _isLoadingTransfer = false;
    getUserInfo();

    update();
    return responseModel;
  }

  Future<ResponseModel> wihdrawBalance(String bankCode) async {
    _isLoadingTransfer = true;
    late ResponseModel responseModel;

    try {
      Response response =
          await userRepo.withdrawBalance(_balanceToWithdraw, bankCode);
      // debugPrint('userCon: ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('userCon: withdrawB success');
        responseModel = ResponseModel(true, response.body['msg']);
        _balanceToWithdraw = _minBalance;
        debugPrint('userCon: withdrawB :$_minBalance');
      } else {
        responseModel = ResponseModel(false, response.statusText!);
        debugPrint('userCon: withdrawB failed');
      }
    } catch (e) {
      _isLoadingTransfer = false;
      responseModel = ResponseModel(false, 'error');

      update();
    }
    _isLoadingTransfer = false;
    getUserInfo();

    update();
    return responseModel;
  }

  void increaseTransferPoints(int val) {
    if (_userModel!.points < _pointsToTransfer + val) {
      showCustomSnackBar('youDontHaveEnoughPoints'.tr);
    } else {
      _pointsToTransfer += val;
      update();
    }
  }

  void decreaseTransferPoints(int val) {
    if (_pointsToTransfer - val >= _minPoints) {
      _pointsToTransfer -= val;
    }
    update();
  }

  void increaseWithdrawalBalance(int val) {
    if (_userModel!.balance < _balanceToWithdraw + val) {
      showCustomSnackBar('youDontHaveEnoughBlance'.tr);
    } else {
      _balanceToWithdraw += val;
      update();
    }
  }

  void decreaseWithdrawalBalance(int val) {
    if (_balanceToWithdraw - val >= _minBalance) {
      _balanceToWithdraw -= val;
    }
    update();
  }
}
