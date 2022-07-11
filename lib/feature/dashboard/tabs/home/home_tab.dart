import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/home_controller.dart';
import 'package:job_seeker/feature/shared/job_card.dart';

import 'home_state.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildSearchBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() {
              if (controller.state is HomeSuccess) {
                return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: (controller.state as HomeSuccess)
                      .jobs
                      .map(
                        (job) => JobCard(
                          job: job,
                          onClick: () {
                            Get.toNamed('/job/details');
                          },
                        ),
                      )
                      .toList(),
                );
              }
              else if(controller.state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              }
              else if(controller.state is HomeEmpty) {
                return Center(child: Text('No jobs found'));
              }
              else {
                return Center(child: Text((controller.state as HomeFailure).error));
              }
            }),
          ),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Discover The Perfect\nJob',
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: ThemeColor().lightGrey),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: ThemeColor().black,
            ),
          )
        ],
      ),
    );
  }

  _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (keyword) {
              Get.toNamed('/job/list', arguments: {'keyword': keyword});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: 'Job title, keyword or company',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                )),
          ),
        ),
      ),
    );
  }
}
