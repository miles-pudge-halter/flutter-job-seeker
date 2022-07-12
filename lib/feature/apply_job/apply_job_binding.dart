import 'package:get/get.dart';
import 'package:job_seeker/data/repository/job_repository.dart';
import 'package:job_seeker/feature/apply_job/apply_job_controller.dart';

class ApplyJobBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(JobRepository());
    Get.put(ApplyJobController());
  }
}