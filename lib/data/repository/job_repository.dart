import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/network/job_datasource.dart';

class JobRepository {
  JobDatasource datasource = Get.put(JobDatasource());

  Future<List<JobModel>> getJobs(
      {String? keyword, String? country, String? employmentType}) async {
    var response = await datasource.getJobs(
      country: country,
      keyword: keyword,
      employmentType: employmentType,
    );
    return response.results;
  }
}
