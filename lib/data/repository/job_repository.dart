import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/network/job_datasource.dart';

class JobRepository {
  JobDatasource datasource = Get.put(JobDatasource());

  Future<List<JobModel>> getJobs() async {
    var response = await datasource.getJobs();
    return response.results;
  }
}