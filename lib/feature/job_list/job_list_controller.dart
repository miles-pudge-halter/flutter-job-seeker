import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/repository/job_repository.dart';
import 'package:job_seeker/feature/job_list/job_list_state.dart';

class JobListController extends GetxController {
  final _stateStream = const JobListState().obs;

  final JobRepository repository = Get.find();

  JobListState get state => _stateStream.value;

  @override
  void onInit() {
    super.onInit();
    String? keyword = Get.arguments['keyword'];
    String? country = Get.arguments['country'];
    getJobs(keyword: keyword, country: country);
  }

  void getJobs({String? keyword, String? country}) async {
    _stateStream.value = JobListLoading();
    try {
      var result =
          await repository.getJobs(keyword: keyword, country: country);
      if (result.isEmpty) {
        _stateStream.value = JobListEmpty();
      } else {
        _stateStream.value = JobListSuccess(jobs: result);
      }
    } catch (e) {
      debugPrint(e.toString());
      _stateStream.value = JobListFailure(error: e.toString());
    }
  }
}
