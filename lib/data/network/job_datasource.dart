import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/data/network/base_network.dart';

class JobDatasource {
  Future<JobListResponse> getJobs({String? keyword, String? country}) async {
    var response = await BaseNetwork.get('/api/jobs/', queryParams: {
      'location': country,
      'search': keyword,
    });
    if (response != null) {
      return JobListResponse.fromJson(response);
    } else {
      return Future.error('Network error');
    }
  }
}
