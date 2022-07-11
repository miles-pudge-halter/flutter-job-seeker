import 'package:get/get.dart';
import 'package:job_seeker/data/network/job_datasource.dart';
import 'package:job_seeker/feature/job_list/job_list_controller.dart';

class JobListBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(JobDatasource());
    Get.put(JobListController());
  }
}