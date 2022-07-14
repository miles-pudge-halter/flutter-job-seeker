import 'package:get/get.dart';
import 'package:job_seeker/data/repository/job_repository.dart';

import 'applied_jobs_controller.dart';

class AppliedJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JobRepository());
    Get.put(AppliedJobsController());
  }
}
