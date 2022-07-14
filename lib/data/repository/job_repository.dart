import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

  Future<List<JobModel>> fetchAppliedJobs() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      FirebaseDatabase database = FirebaseDatabase.instance;
      var ref = database.ref('users/${currentUser.uid}/jobs');

      List<JobModel> jobs = [];

      final snapshot = await ref.get();
      if (snapshot.exists) {
        final list = snapshot.value as List<dynamic>;
        for (var element in list) {
          print(element);
          if (element != null) {
            jobs.add(JobModel.fromJson(Map<String, dynamic>.from(element)));
          }
        }
      }
      return jobs;
    } else {
      return Future.error('User session not found');
    }
  }

  Future<dynamic> applyJob(JobModel job) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      FirebaseDatabase database = FirebaseDatabase.instance;
      var ref = database.ref('users/${currentUser.uid}/jobs');

      List<Map<String, dynamic>> jobs = <Map<String, dynamic>>[];

      final snapshot = await ref.get();
      if (snapshot.exists) {
        final list = snapshot.value as List<dynamic>;
        for (var element in list) {
          jobs.add(Map<String, dynamic>.from(element));
        }
      }
      final findExistingJobs = jobs.where((element) => element['id'] == job.id);
      if (findExistingJobs.isEmpty) {
        jobs.add(job.toJson());
      } else {
        return Future.error('Job already applied');
      }
      await ref.set(jobs);
      return Future.value(true);
    } else {
      return Future.error('User session not found');
    }
  }
}
