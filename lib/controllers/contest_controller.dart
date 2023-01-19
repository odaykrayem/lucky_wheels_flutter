// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_wheels_flutter/data/repository/contest_repo.dart';
import 'package:lucky_wheels_flutter/models/response_model.dart';

import '../models/contest_model.dart';

class ContestController extends GetxController {
  final ContestRepo contestRepo;

  ContestController({
    required this.contestRepo,
  });

  List<dynamic> _contestList = [];
  List<dynamic> get contestList => _contestList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  bool _isPLoading = false;
  bool get isPLoading => _isPLoading;

  Future<void> getContestList() async {
    Response response = await contestRepo.getContestList();
    debugPrint('Contest responce : ${response.bodyString}');
    debugPrint('Contest responce : ${response.statusCode}');
    debugPrint('Contest responce : ${response.statusText}');
    if (response.statusCode == 200) {
      // debugPrint('product controller : product got');
      _contestList = []; //initialze to not repeat data
      List<dynamic> map = response.body['data'];
      _contestList =
          map.map((elemnt) => ContestModel.fromJson(elemnt)).toList();
      _contestList.forEach((element) {
        debugPrint(element.toString());
      });
      _isLoaded = true;
      update(); //it works like setState to update ui
    } else {
      debugPrint('contest controller : could not get contest');
    }
  }

  Future<ResponseModel> participateContest(int contestId) async {
    _isPLoading = true;
    debugPrint('contestCon' + '${contestId}');
    Response response = await contestRepo.participateContest(contestId);
    debugPrint('PContest responce : ${response.bodyString}');
    debugPrint('PContest responce : ${response.statusCode}');
    debugPrint('PContest responce : ${response.statusText}');
    late ResponseModel responseModel;

    if (response.statusCode == 200 || response.statusCode == 201) {
      debugPrint('contestCon: Particapate success');
      responseModel = ResponseModel(true, 'participateContestSuccessfully'.tr);
      ContestModel c = _contestList[
          _contestList.indexWhere((element) => element.id == contestId)];
      ContestModel cc = ContestModel(
          id: c.id,
          description: c.description,
          prize: c.prize,
          duration: c.duration,
          isFinished: c.isFinished,
          isParticipant: true,
          createdAt: c.createdAt);
      _contestList[
          _contestList.indexWhere((element) => element.id == contestId)] = cc;
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      debugPrint('contestCon: particoate failed');
    }
    _isPLoading = false;
    update();

    return responseModel;
  }
}
