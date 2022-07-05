import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';

class HomeController extends GetxController {
  RxList<JobModel> jobs = RxList.empty();


  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  fetchJobs() {
    jobs.value = [
      JobModel(
        id: '1',
        role: 'Android Engineer',
        companyName: 'Google',
        datePosted: '1/1/1999',
        keywords: ['keywords'],
        remote: false,
        logo:
            'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
      ),
      JobModel(
        id: '2',
        role: 'UX Designer',
        companyName: 'Google',
        datePosted: '1/1/1999',
        keywords: ['keywords'],
        remote: false,
        logo:
        'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
      ),
      JobModel(
        id: '3',
        role: 'Pretty Janitor',
        companyName: 'Google',
        datePosted: '1/1/1999',
        keywords: ['keywords'],
        remote: false,
        logo:
        'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
      ),
    ];
  }
}
