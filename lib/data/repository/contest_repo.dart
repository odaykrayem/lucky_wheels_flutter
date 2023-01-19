// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../api/api_client.dart';

class ContestRepo extends GetxService {
  final ApiClient apiClient;

  ContestRepo({
    required this.apiClient,
  });

  Future<Response> getContestList() async {
    return await apiClient.getData(AppConstants.CONTEST_LIST);
  }

  Future<Response> participateContest(int contestId) async {
    return await apiClient
        .postData(AppConstants.PARTICIPATE_CONTEST, {'contest_id': contestId});
  }
}
