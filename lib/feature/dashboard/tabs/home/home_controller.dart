import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/repository/job_repository.dart';

class HomeController extends GetxController {
  RxList<JobModel> jobs = RxList.empty();

  JobRepository repository = Get.find();

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  fetchJobs() async {
    jobs.value = await repository.getJobs();
  }
}
