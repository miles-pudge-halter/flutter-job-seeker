import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/repository/job_repository.dart';

import 'apply_job_state.dart';

class ApplyJobController extends GetxController {

  final _stateStream = ApplyJobState().obs;

  ApplyJobState get state => _stateStream.value;

  final JobRepository repository = Get.find();

  applyJob(JobModel job) async {
    _stateStream.value = ApplyJobLoading();
    try {
      await repository.applyJob(job);
      Get.back();
      Get.snackbar('Job applied', 'Thank you for applying');
      _stateStream.value = ApplyJobSuccess();
    } catch (e) {
      print(e);
      _stateStream.value = ApplyJobFailure(error: e.toString());
      Get.snackbar('Error', e.toString());
    }
  }
}