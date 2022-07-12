import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/repository/job_repository.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/home_state.dart';

class HomeController extends GetxController {
  JobRepository repository = Get.find();
  final _stateStream = const HomeState().obs;

  final _filterValue = ''.obs;
  String get filterValue => _filterValue.value;

  HomeState get state => _stateStream.value;

  final heroItem = Rxn<JobModel>();

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  void changeFilterValue(String value) {
    _filterValue.value = value;
    fetchJobs();
  }

  void fetchJobs() async {
    try {
      _stateStream.value = HomeLoading();
      var jobs = await repository.getJobs(employmentType: filterValue);
      if (jobs.isEmpty) {
        _stateStream.value = HomeEmpty();
      } else {
        heroItem.value = jobs.first;
        _stateStream.value = HomeSuccess(jobs: jobs..removeAt(0));
      }
    } catch (e) {
      _stateStream.value = HomeFailure(error: e.toString());
      debugPrint(e.toString());
    }
  }
}
