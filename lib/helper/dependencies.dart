import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/controllers/auth_controller.dart';
import 'package:lucky_wheels_flutter/controllers/contest_controller.dart';
import 'package:lucky_wheels_flutter/controllers/reward_controller.dart';
import 'package:lucky_wheels_flutter/controllers/user_controller.dart';
import 'package:lucky_wheels_flutter/data/repository/auth_repo.dart';
import 'package:lucky_wheels_flutter/data/repository/contest_repo.dart';
import 'package:lucky_wheels_flutter/data/repository/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../data/api/api_client.dart';
import '../data/repository/reward_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //API clients
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => ContestRepo(apiClient: Get.find()));
  Get.lazyPut(() => RewardRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => ContestController(contestRepo: Get.find()));
  Get.lazyPut(() => RewardController(rewardRepo: Get.find()));
}
