// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/models/response_model.dart';
import '../data/repository/reward_repo.dart';
import '../models/reward_model.dart';

class RewardController extends GetxController {
  final RewardRepo rewardRepo;

  RewardController({
    required this.rewardRepo,
  });

  List<dynamic> _rewardList = [];
  List<dynamic> get rewardList => _rewardList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  bool _isPLoading = false;
  bool get isPLoading => _isPLoading;

  Future<void> getRewardList() async {
    Response response = await rewardRepo.getRewardList();
    debugPrint('Reward responce : ${response.bodyString}');
    debugPrint('Reward responce : ${response.statusCode}');
    debugPrint('Reward responce : ${response.statusText}');
    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      _rewardList = []; //initialze to not repeat data
      List<dynamic> map = response.body['data'];
      _rewardList = map.map((elemnt) => RewardModel.fromJson(elemnt)).toList();
      _rewardList.forEach((element) {
        debugPrint(element.toString());
      });
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('reward controller : could not get reward');
    }
  }

  Future<ResponseModel> reward(int rewardId) async {
    _isPLoading = true;
    debugPrint('rewardCon' + '${rewardId}');
    Response response = await rewardRepo.reward(rewardId);
    debugPrint('PReward responce : ${response.bodyString}');
    debugPrint('PReward responce : ${response.statusCode}');
    debugPrint('PReward responce : ${response.statusText}');
    late ResponseModel responseModel;

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('rewardCon: Particapate success');
      responseModel = ResponseModel(true, 'rewardAddedToYourPoints'.tr);
      // RewardModel c = _rewardList[
      //     _rewardList.indexWhere((element) => element.id == rewardId)];
      // RewardModel cc = RewardModel(
      //     id: c.id, value: c.value, duration: c.duration, isOn: false);
      // _rewardList[_rewardList.indexWhere((element) => element.id == rewardId)] =
      //     cc;
      getRewardList();
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('rewardCon: particoate failed');
    }
    _isPLoading = false;
    update();

    return responseModel;
  }
}
