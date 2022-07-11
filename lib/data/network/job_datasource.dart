import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/network/base_network.dart';

class JobDatasource {
  Future<JobListResponse> getJobs() async {
    var response = await BaseNetwork.get('/api/jobs/');
    if (response != null) {
      return JobListResponse.fromJson(response);
    } else {
      return Future.error('Network error');
    }
  }
}
