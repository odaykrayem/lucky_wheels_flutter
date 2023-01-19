// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/utils/cacheHelper.dart';
import '../../constants/app_constants.dart';
import '../api/api_client.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({
    required this.apiClient,
  });

  Future<Response> getUserInfo() async {
    return await apiClient.getData(
      AppConstants.USER_INFO_URI,
    );
  }

  Future<Response> getMinPoints() async {
    return await apiClient.getData(
      AppConstants.MIN_POINTS,
    );
  }

  Future<Response> getMinBalance() async {
    return await apiClient.getData(
      AppConstants.MIN_BALANCE,
    );
  }

  // bool saveUserToken(String token)
  // String getUserToken() {
  //   return CacheHelper.getData(key: AppConstants.USER_TOKEN_KEY);
  // }

  Future<Response> wheelPoints(var points) async {
    return await apiClient
        .postData(AppConstants.WHEEL_POINTS_URI, {'points': points});
  }

  Future<Response> transferPoints(var points) async {
    return await apiClient
        .postData(AppConstants.TRANSFER_POINTS, {'points': points});
  }

  Future<Response> withdrawBalance(
      double balanceToWithdraw, String bankCode) async {
    return await apiClient.postData(AppConstants.WITHDRAW_BALANCE, {
      'amount': balanceToWithdraw,
      'bank_code': bankCode,
    });
  }
}
