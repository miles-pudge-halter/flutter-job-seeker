import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/repository/job_repository.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/home_state.dart';

class HomeController extends GetxController {
  JobRepository repository = Get.find();
  final _stateStream = const HomeState().obs;

  HomeState get state => _stateStream.value;

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  void fetchJobs() async {
    try {
      _stateStream.value = HomeLoading();
      var jobs = await repository.getJobs();
      if (jobs.isEmpty) {
        _stateStream.value = HomeEmpty();
      } else {
        _stateStream.value = HomeSuccess(jobs: jobs);
      }
    } catch (e) {
      _stateStream.value = HomeFailure(error: e.toString());
      debugPrint(e.toString());
    }
  }
}
