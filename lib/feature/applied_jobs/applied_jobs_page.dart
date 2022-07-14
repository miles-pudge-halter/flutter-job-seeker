import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/feature/applied_jobs/applied_jobs_controller.dart';
import 'package:job_seeker/feature/applied_jobs/applied_jobs_loading.dart';
import 'package:job_seeker/feature/shared/job_card.dart';

import '../shared/buttons.dart';

class AppliedJobsPage extends StatelessWidget {
  AppliedJobsPage({Key? key}) : super(key: key);

  final AppliedJobsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionIcon(
                      icon: Icons.arrow_back,
                      onClick: () {
                        Get.back();
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Applied jobs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Obx(() {
                        if (controller.state is AppliedJobsLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (controller.state is AppliedJobsLoaded) {
                          return ListView(
                            shrinkWrap: true,
                            children: (controller.state as AppliedJobsLoaded)
                                .jobs
                                .map((item) {
                              return JobCard(job: item, onClick: () {});
                            }).toList(),
                          );
                        } else {
                          return Center(
                            child: Text(
                                (controller.state as AppliedJobsFailure).error),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
