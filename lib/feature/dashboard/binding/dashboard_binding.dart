import 'package:get/get.dart';
import 'package:job_seeker/data/repository/job_repository.dart';
import 'package:job_seeker/feature/dashboard/controller/dashboard_controller.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/home_controller.dart';
import 'package:job_seeker/feature/dashboard/tabs/job/controller/job_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JobRepository());
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(JobController());
  }
}
