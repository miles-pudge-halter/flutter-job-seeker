import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/feature/job_list/job_list_controller.dart';
import 'package:job_seeker/feature/job_list/job_list_state.dart';
import 'package:job_seeker/feature/shared/job_card.dart';

import '../shared/buttons.dart';

class JobListPage extends StatelessWidget {
  String? country;
  String? keyword;

  JobListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    country = Get.arguments['country'];
    keyword = Get.arguments['keyword'];
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
                  children: [
                    ActionIcon(
                      icon: Icons.arrow_back,
                      onClick: () {
                        Get.back();
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey.shade400,
                    ),
                    const SizedBox(width: 16),
                    (keyword != null)
                        ? Text(
                            'Jobs for $keyword',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : SizedBox(width: 0),
                    (country != null)
                        ? Text(
                            'Jobs in $country',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : SizedBox(width: 0),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  if (controller.state is JobListSuccess) {
                    return ListView(
                        children: (controller.state as JobListSuccess)
                            .jobs
                            .map(
                              (job) => JobCard(
                                job: job,
                                onClick: () {
                                  Get.toNamed('/job/details',
                                      arguments: {'job': job});
                                },
                              ),
                            )
                            .toList());
                  } else if (controller.state is JobListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.state is JobListEmpty) {
                    return const Center(
                      child: Text('No jobs found'),
                    );
                  } else {
                    return Center(
                      child: Text((controller.state as JobListFailure).error),
                    );
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
