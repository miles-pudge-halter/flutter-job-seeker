import 'package:get/get.dart';
import 'package:job_seeker/data/repository/job_repository.dart';

import 'applied_jobs_loading.dart';

class AppliedJobsController extends GetxController {

  final _stateStream = AppliedJobsState().obs;
  AppliedJobsState get state => _stateStream.value;

  final JobRepository repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchAppliedJobs();
  }

  void fetchAppliedJobs() async {
    _stateStream.value = AppliedJobsLoading();
    try {
      var jobs = await repository.fetchAppliedJobs();
      _stateStream.value = AppliedJobsLoaded(jobs: jobs);
    } catch(e) {
      print(e);
      _stateStream.value = AppliedJobsFailure(error: e.toString());
    }
  }
}