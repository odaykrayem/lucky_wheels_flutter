// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../api/api_client.dart';

class RewardRepo extends GetxService {
  final ApiClient apiClient;

  RewardRepo({
    required this.apiClient,
  });

  Future<Response> getRewardList() async {
    return await apiClient.getData(AppConstants.REWARD_LIST);
  }

  Future<Response> reward(int rewardId) async {
    return await apiClient
        .postData(AppConstants.REWARD, {'reward_id': rewardId});
  }
}
